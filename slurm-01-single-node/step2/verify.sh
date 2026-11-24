#!/bin/bash
ls /root/hello-*.out >/dev/null 2>&1 && grep -q . /root/hello-*.out