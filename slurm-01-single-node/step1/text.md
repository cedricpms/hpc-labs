Run `sinfo` and `scontrol show node`. Then print the node's **real** hardware line:
```
slurmd -C
```
Save the first line (the one starting with `NodeName=`) into `/root/node.txt`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
