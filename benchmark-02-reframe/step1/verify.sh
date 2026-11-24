#!/bin/bash
grep -q 'PASSED' /root/run1.txt && ! grep -q 'FAILED' /root/run1.txt