Two MPI ranks, each writing its own 64 MB file (`-F`), 1 MB transfers:
```
mpirun --allow-run-as-root --oversubscribe -np 2 ior -a POSIX -F -b 64m -t 1m -o /scratch/test -w -r | tee /root/ior-fpp.txt
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
