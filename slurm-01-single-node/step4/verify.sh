#!/bin/bash
s=$(sinfo -h -o %T | head -1); [[ "$s" == idle* || "$s" == mixed* || "$s" == alloc* ]]