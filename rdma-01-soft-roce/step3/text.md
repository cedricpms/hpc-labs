Run a server and a client on the same machine:
```
ib_write_bw -d rxe0 &          # server
sleep 1; ib_write_bw -d rxe0 10.99.0.1 | tee /root/bw.txt   # client
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
