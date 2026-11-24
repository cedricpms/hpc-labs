Try a job as alice:
```
sudo -u alice sbatch --wrap=hostname
```
You get **Invalid account or account/partition combination**. Fix it: create the account `eae-users` and add alice to it.
```
sacctmgr -i add account eae-users
sacctmgr -i add user alice account=eae-users
```
Submit again as alice; it should work now.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
