See what the server exports, then mount it:
```
showmount -e localhost
mount -t nfs 127.0.0.1:/srv/share /mnt/share
cat /mnt/share/readme.txt
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
