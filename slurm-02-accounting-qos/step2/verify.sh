#!/bin/bash
for a in eae-admins eae-power-users eae-standard; do sacctmgr -n -P show account $a format=account | grep -qx $a || exit 1; done
sacctmgr -n -P show assoc tree format=account,parentname | grep -q 'eae-standard|eae-users'