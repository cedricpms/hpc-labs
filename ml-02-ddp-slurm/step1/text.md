Write `/root/ddp.sbatch`:
```
#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=2
#SBATCH --output=/root/ddp-%j.out
torchrun --nproc_per_node=2 /root/train_ddp.py
```
Submit it and wait for the output.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
