Write `/root/hello.def`:
```
Bootstrap: docker
From: alpine
%post
    apk add --no-cache curl
%runscript
    echo "Hello from $(cat /etc/alpine-release) with $(curl --version | head -1 | cut -d' ' -f1-2)"
```
Build and run it:
```
apptainer build /root/hello.sif /root/hello.def
apptainer run /root/hello.sif
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
