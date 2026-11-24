Run the same script with **2** processes and save to `/root/run2.txt`. Then print the environment torchrun gives each process:
```
torchrun --nproc_per_node=2 /usr/bin/env | grep -E '^(RANK|WORLD_SIZE|LOCAL_RANK|MASTER_ADDR|MASTER_PORT)=' | sort -u
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
