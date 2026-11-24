#!/bin/bash
echo "Setting up your lab environment (2-5 minutes)..."
while [ ! -f /tmp/lab-ready ]; do sleep 3; echo -n "."; done
echo; echo "Ready! Start with the first step."
