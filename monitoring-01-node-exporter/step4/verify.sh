#!/bin/bash
grep -q firing /tmp/alert-seen 2>/dev/null || (curl -s localhost:9090/api/v1/alerts | grep -q '"state":"firing"' && echo firing > /tmp/alert-seen)