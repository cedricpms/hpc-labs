#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq python3-venv >/dev/null
python3 -m venv /opt/rfm && /opt/rfm/bin/pip -q install reframe-hpc
ln -sf /opt/rfm/bin/reframe /usr/local/bin/reframe
mkdir -p /root/tests
cat > /root/tests/hello_test.py <<'P'
import reframe as rfm
import reframe.utility.sanity as sn

@rfm.simple_test
class HelloTest(rfm.RunOnlyRegressionTest):
    valid_systems = ['*']
    valid_prog_environs = ['*']
    executable = 'echo'
    executable_opts = ['Hello, ReFrame']

    @sanity_function
    def check(self):
        return sn.assert_found(r'Hello, ReFrame', self.stdout)
P
cat > /root/tests/broken_test.py <<'P'
import reframe as rfm
import reframe.utility.sanity as sn

@rfm.simple_test
class CpuCountTest(rfm.RunOnlyRegressionTest):
    valid_systems = ['*']
    valid_prog_environs = ['*']
    executable = 'nproc'

    @sanity_function
    def check(self):
        # BUG: nproc prints a number, not this text
        return sn.assert_found(r'CPUs available', self.stdout)
P

touch /tmp/lab-ready
