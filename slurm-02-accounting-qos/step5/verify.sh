#!/bin/bash
sacct -n -P -u bob -X -o account,qos | grep -q 'eae-standard|standard'