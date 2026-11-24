#!/bin/bash
sacctmgr -n -P show assoc user=alice format=account | grep -qx eae-users