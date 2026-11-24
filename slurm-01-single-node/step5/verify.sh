#!/bin/bash
pgrep -x slurmd >/dev/null && s=$(sinfo -h -o %T | head -1) && [[ "$s" == idle* ]]