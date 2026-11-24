Submit a job that asks for more memory than the node has:
```
sbatch --mem=999G --wrap="sleep 10"
```
Find the reason Slurm gives (`squeue` REASON column or `sbatch` error) and write it in `/root/reason.txt`. Then cancel anything left with `scancel`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
