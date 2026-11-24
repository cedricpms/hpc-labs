#!/bin/bash
grep -E '^127\.0\.0\.1:/srv/share\s+/mnt/share\s+nfs\s+.*_netdev.*x-systemd.automount' /etc/fstab >/dev/null && systemctl is-active mnt-share.automount >/dev/null