Try to make `standard` the default QOS of `eae-standard` **before** allowing it:
```
sacctmgr -i modify account eae-standard set defaultqos=standard
```
Read the error. Fix it the right way: first allow the QOS (`set qos+=standard`), then set the default.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
