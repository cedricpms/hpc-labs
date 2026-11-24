#!/bin/bash
[ -x /root/rdma_check.sh ] || exit 1
ip link set rdmalab0 down; sleep 2; /root/rdma_check.sh >/dev/null 2>&1; d=$?
ip link set rdmalab0 up; sleep 3; /root/rdma_check.sh >/dev/null 2>&1; u=$?
[ $d -ne 0 ] && [ $u -eq 0 ]