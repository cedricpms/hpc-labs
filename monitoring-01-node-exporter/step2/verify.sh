#!/bin/bash
curl -s localhost:9090/api/v1/targets | grep -q '"job":"node"' && curl -s 'localhost:9090/api/v1/query?query=up%7Bjob%3D%22node%22%7D' | grep -q '"1"'