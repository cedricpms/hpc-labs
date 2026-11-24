#!/bin/bash
[ -f /root/hello.sif ] && apptainer run /root/hello.sif | grep -q 'Hello from'