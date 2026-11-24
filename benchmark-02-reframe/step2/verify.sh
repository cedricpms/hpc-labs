#!/bin/bash
grep -q 'PASSED' /root/run2.txt && ! grep -q 'FAILED' /root/run2.txt