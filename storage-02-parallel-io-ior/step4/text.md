Lustre problems are often **metadata** problems. Measure file creates/stats/removes:
```
mpirun --allow-run-as-root --oversubscribe -np 2 mdtest -n 1000 -d /scratch/md | tee /root/mdtest.txt
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
