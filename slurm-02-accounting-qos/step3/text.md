Create QOS `admin`, `power_user`, `standard` with priorities **100, 50, 10**:
```
sacctmgr -i add qos standard priority=10
```
(and the other two). Check with `sacctmgr show qos format=name,priority`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
