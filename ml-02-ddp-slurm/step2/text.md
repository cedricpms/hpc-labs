Now let **Slurm** start the 2 processes. Write `/root/srun.sbatch` with `--ntasks=2` and output `/root/srun-%j.out` that runs:
```
export MASTER_ADDR=localhost MASTER_PORT=29500
srun bash -c 'RANK=$SLURM_PROCID WORLD_SIZE=$SLURM_NTASKS LOCAL_RANK=$SLURM_LOCALID ddp-python /root/train_ddp.py'
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
