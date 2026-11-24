Users say `/mnt/share` is empty or hangs. Diagnose from the client side first (`showmount -e localhost`, `journalctl -u nfs-server`, `cat /etc/exports`), find what changed, fix it, and make `/mnt/share/readme.txt` readable again.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
