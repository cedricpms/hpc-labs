#!/bin/bash
ls /root/pp-*.out >/dev/null 2>&1 && grep -q latency_us /root/pp-*.out