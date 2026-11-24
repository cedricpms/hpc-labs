Unmount it (`umount /mnt/share`) and add an `/etc/fstab` line that waits for the network and mounts on first access:
```
127.0.0.1:/srv/share  /mnt/share  nfs  _netdev,x-systemd.automount,noauto  0 0
```
Then `systemctl daemon-reload` and `systemctl restart remote-fs.target`, and touch the mount: `ls /mnt/share`.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
