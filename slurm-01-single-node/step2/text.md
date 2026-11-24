Create `/root/hello.sh`:
```
#!/bin/bash
#SBATCH --job-name=hello
#SBATCH --output=/root/hello-%j.out
hostname; date; sleep 5
```
Submit it with `sbatch /root/hello.sh`, watch it with `squeue`, and wait for the output file.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
