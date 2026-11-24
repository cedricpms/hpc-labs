#!/bin/bash
[ $(grep -c 'Hello from rank' /root/hello.txt) -eq 4 ]