#!/bin/bash
grep -q 'PASSED' /root/run3.txt && grep -qE 'P: .*MB/s' /root/run3.txt