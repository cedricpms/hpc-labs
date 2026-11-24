Stop the exporter like a dead node would: `systemctl stop prometheus-node-exporter`.
Watch `curl -s localhost:9090/api/v1/alerts` until NodeDown is **firing** (about 40 s). Then start the exporter again.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
