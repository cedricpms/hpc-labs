node_exporter serves metrics on port 9100. Find the 1-minute load average:
```
curl -s localhost:9100/metrics | grep '^node_load1'
```
Save that line to `/root/load.txt`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
