Containers can't see host folders unless you bind them. Write a file **from inside** the container into the host's `/root/data`:
```
apptainer exec --bind /root/data:/data /root/hello.sif sh -c 'echo from-container > /data/proof.txt'
```

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
