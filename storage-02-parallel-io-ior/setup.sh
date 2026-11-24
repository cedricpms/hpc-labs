#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq openmpi-bin libopenmpi-dev build-essential git autoconf automake pkg-config >/dev/null
git clone -q --depth 1 https://github.com/hpc/ior.git /opt/ior && cd /opt/ior && ./bootstrap && ./configure && make -j$(nproc)
ln -sf /opt/ior/src/ior /usr/local/bin/ior; ln -sf /opt/ior/src/mdtest /usr/local/bin/mdtest
mkdir -p /scratch
echo 'alias mpirun="mpirun --allow-run-as-root --oversubscribe"' >> /root/.bashrc

touch /tmp/lab-ready
