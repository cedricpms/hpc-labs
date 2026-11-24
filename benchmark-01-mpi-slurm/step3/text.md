Write `/root/pp.sbatch` that asks for `--ntasks=2`, writes output to `/root/pp-%j.out`, and runs:
```
mpirun --allow-run-as-root --oversubscribe -np $SLURM_NTASKS /root/pingpong
```
Submit with `sbatch`, wait, then check the job with `scontrol show job <id>` while it runs or the output file after.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
