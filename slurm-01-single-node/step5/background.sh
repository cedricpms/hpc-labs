#!/bin/bash
pkill -x slurmd; sleep 1; scontrol update nodename=$(hostname -s) state=down reason="Not responding" 2>/dev/null || true
