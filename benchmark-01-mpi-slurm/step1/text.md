```
mpicc -o /root/hello /root/hello.c
mpirun --allow-run-as-root --oversubscribe -np 4 /root/hello | tee /root/hello.txt
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
