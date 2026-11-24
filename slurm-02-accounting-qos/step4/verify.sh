#!/bin/bash
sacctmgr -n -P show assoc account=eae-standard format=defaultqos | grep -qx standard