#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x
# Installs and starts a single-node Slurm cluster (controller + compute on this VM).
export DEBIAN_FRONTEND=noninteractive
apt-get update -qq
apt-get install -y -qq slurm-wlm munge >/dev/null
H=$(hostname -s); CPUS=$(nproc); MEM=$(( $(free -m | awk '/Mem:/{print $2}') - 512 ))
mkdir -p /etc/slurm /var/spool/slurmctld /var/spool/slurmd /var/log/slurm
chown slurm:slurm /var/spool/slurmctld /var/log/slurm
cat > /etc/slurm/slurm.conf <<CONF
ClusterName=lab
SlurmctldHost=$H
SlurmUser=slurm
AuthType=auth/munge
StateSaveLocation=/var/spool/slurmctld
SlurmdSpoolDir=/var/spool/slurmd
SlurmctldLogFile=/var/log/slurm/slurmctld.log
SlurmdLogFile=/var/log/slurm/slurmd.log
ProctrackType=proctrack/linuxproc
TaskPlugin=task/none
SelectType=select/cons_tres
SelectTypeParameters=CR_Core_Memory
MpiDefault=none
ReturnToService=2
NodeName=$H CPUs=$CPUS RealMemory=$MEM State=UNKNOWN
PartitionName=debug Nodes=ALL Default=YES MaxTime=INFINITE State=UP
CONF
[ -f /etc/munge/munge.key ] || /usr/sbin/mungekey -c 2>/dev/null || dd if=/dev/urandom bs=1 count=1024 of=/etc/munge/munge.key 2>/dev/null
chown munge:munge /etc/munge/munge.key; chmod 400 /etc/munge/munge.key
if pidof systemd >/dev/null; then
  systemctl restart munge slurmctld slurmd
else
  pgrep munged >/dev/null || (mkdir -p /run/munge && chown munge:munge /run/munge && sudo -u munge /usr/sbin/munged)
  pkill slurmctld; pkill slurmd; sleep 1; slurmctld; slurmd
fi
for i in $(seq 1 30); do sinfo -h -o %T 2>/dev/null | grep -qE 'idle|mixed' && break; sleep 2; done
scontrol update nodename=$H state=resume 2>/dev/null || true
# Adds Slurm accounting (MariaDB + slurmdbd) on top of slurm-setup.sh.
export DEBIAN_FRONTEND=noninteractive
apt-get install -y -qq slurmdbd mariadb-server >/dev/null
if pidof systemd >/dev/null; then systemctl restart mariadb; else (pgrep mariadbd >/dev/null || (mkdir -p /run/mysqld && chown mysql:mysql /run/mysqld && (mysqld_safe >/dev/null 2>&1 &) ) ); fi
for i in $(seq 1 30); do mysqladmin ping >/dev/null 2>&1 && break; sleep 1; done
mysql -e "CREATE DATABASE IF NOT EXISTS slurm_acct_db; CREATE USER IF NOT EXISTS 'slurm'@'localhost' IDENTIFIED BY 'labpass'; GRANT ALL ON slurm_acct_db.* TO 'slurm'@'localhost'; FLUSH PRIVILEGES;"
cat > /etc/slurm/slurmdbd.conf <<CONF
AuthType=auth/munge
DbdHost=localhost
SlurmUser=slurm
LogFile=/var/log/slurm/slurmdbd.log
PidFile=/run/slurmdbd.pid
StorageType=accounting_storage/mysql
StorageHost=localhost
StorageUser=slurm
StoragePass=labpass
StorageLoc=slurm_acct_db
CONF
chown slurm:slurm /etc/slurm/slurmdbd.conf; chmod 600 /etc/slurm/slurmdbd.conf
grep -q AccountingStorageType /etc/slurm/slurm.conf || cat >> /etc/slurm/slurm.conf <<CONF
AccountingStorageType=accounting_storage/slurmdbd
AccountingStorageHost=localhost
AccountingStorageEnforce=associations,limits,qos
JobAcctGatherType=jobacct_gather/linux
PriorityType=priority/multifactor
PriorityWeightQOS=10000
PriorityWeightFairshare=1000
CONF
if pidof systemd >/dev/null; then systemctl restart slurmdbd; else pgrep slurmdbd >/dev/null || slurmdbd; fi
for i in $(seq 1 30); do sacctmgr -n show cluster >/dev/null 2>&1 && break; sleep 2; done
sacctmgr -i add cluster lab >/dev/null 2>&1 || true
if pidof systemd >/dev/null; then systemctl restart slurmctld; else pkill slurmctld; sleep 2; slurmctld; fi
sleep 3
useradd -m alice; useradd -m bob

touch /tmp/lab-ready
