Create `/root/tests/perf_test.py`: a `RunOnlyRegressionTest` that runs
```
dd if=/dev/zero of=/tmp/rfm.bin bs=1M count=256 conv=fdatasync
```
and uses `@performance_function('MB/s')` to extract the speed from `dd`'s output (it is on **stderr**: `self.stderr`; a fast disk may print `GB/s`, so match the unit you see). Run it and save the output to `/root/run3.txt`. Look for the `P:` performance line.

> Tip: click **Check** when you are done. If the check fails, read the hint, fix it, and check again.
