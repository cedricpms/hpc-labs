Something just happened to the node. Find out **why** it is not idle (hints: `sinfo -R`, `scontrol show node`, is `slurmd` running? `pgrep -a slurmd`, `/var/log/slurm/slurmd.log`).

Fix the cause, then resume the node if needed, so `sinfo` shows `idle`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
