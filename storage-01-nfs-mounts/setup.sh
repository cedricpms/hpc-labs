#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq nfs-kernel-server nfs-common >/dev/null
mkdir -p /srv/share /mnt/share; echo "shared data" > /srv/share/readme.txt
echo "/srv/share 127.0.0.1(rw,sync,no_subtree_check,no_root_squash)" > /etc/exports
exportfs -ra; systemctl restart nfs-server

touch /tmp/lab-ready
