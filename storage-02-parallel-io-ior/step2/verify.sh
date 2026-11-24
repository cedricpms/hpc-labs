#!/bin/bash
grep -q '^write' /root/ior-shared.txt && grep -q 'Command line.*ior' /root/ior-shared.txt && ! grep -q 'Command line.* -F' /root/ior-shared.txt