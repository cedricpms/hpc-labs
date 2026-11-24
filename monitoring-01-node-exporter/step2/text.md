Edit `/etc/prometheus/prometheus.yml` and add a scrape job named **node** for `localhost:9100`. Then reload:
```
systemctl reload prometheus || systemctl restart prometheus
```
Check targets at `curl -s localhost:9090/api/v1/targets | grep -o '"job":"node"'`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
