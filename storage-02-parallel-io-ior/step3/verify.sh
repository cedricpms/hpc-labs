#!/bin/bash
grep -q '^write' /root/ior-4k.txt && [ $(grep -oE '[0-9]+(\.[0-9]+)?' /root/notes.txt | wc -l) -ge 2 ]