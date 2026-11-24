#!/bin/bash
[ $(grep -c 'latency_us' /root/pingpong.txt) -ge 4 ]