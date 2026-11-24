History-based checks miss nodes that are **still** broken. Write `/root/rdma_check.sh` that exits **0** when every RDMA port is `ACTIVE` and **1** otherwise (hint: `rdma link show` or `ibv_devinfo`). Make it executable.

The check will take the link down (`ip link set rdmalab0 down`), expect exit 1, bring it back up, and expect exit 0.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
