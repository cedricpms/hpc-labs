```
rdma link add rxe0 type rxe netdev rdmalab0
rdma link
```
You should see `rxe0` with state **ACTIVE**. (If `/root/NOTE-rxe-missing.txt` exists, this kernel lacks Soft-RoCE: read the steps and do them on your homelab instead.)

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
