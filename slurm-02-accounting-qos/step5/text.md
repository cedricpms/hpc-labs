Add `bob` to `eae-standard`, then submit a job as bob that uses that account and QOS:
```
sudo -u bob sbatch -A eae-standard --qos=standard --wrap="sleep 5"
```
Confirm with `sacct -u bob -o jobid,account,qos,state`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
