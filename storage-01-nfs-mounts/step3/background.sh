#!/bin/bash
sed -i 's#^/srv/share#/srv/oldshare#' /etc/exports; mkdir -p /srv/oldshare; exportfs -ra; umount -l /mnt/share 2>/dev/null; true
