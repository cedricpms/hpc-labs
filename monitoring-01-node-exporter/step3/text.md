Create `/etc/prometheus/rules/node.yml` with an alert **NodeDown** that fires when `up{job="node"} == 0` for `30s`, add
```
rule_files:
  - /etc/prometheus/rules/*.yml
```
to the config, and reload. Validate first with `promtool check rules /etc/prometheus/rules/node.yml`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
