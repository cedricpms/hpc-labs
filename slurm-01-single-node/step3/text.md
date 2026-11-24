Put the node in maintenance with a clear reason (exactly `lab maintenance`):
```
scontrol update nodename=$(hostname -s) state=drain reason="lab maintenance"
```
Then look at it the way you would at work: `sinfo -R`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
