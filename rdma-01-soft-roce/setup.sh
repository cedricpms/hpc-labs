#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq rdma-core ibverbs-utils perftest rdmacm-utils iproute2 >/dev/null
apt-get install -y -qq linux-modules-extra-$(uname -r) >/dev/null 2>&1 || true
modprobe rdma_rxe || echo "rdma_rxe module not available on this kernel" > /root/NOTE-rxe-missing.txt
ip link add rdmalab0 type dummy; ip addr add 10.99.0.1/24 dev rdmalab0; ip link set rdmalab0 up

touch /tmp/lab-ready
