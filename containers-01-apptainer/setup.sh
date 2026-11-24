#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq software-properties-common curl >/dev/null
if add-apt-repository -y ppa:apptainer/ppa && apt-get update -qq && apt-get install -y -qq apptainer; then :; else
  V=$(curl -sI https://github.com/apptainer/apptainer/releases/latest | awk -F/ 'tolower($1)~/location/{print $NF}' | tr -d '\r')
  curl -sLo /tmp/a.deb "https://github.com/apptainer/apptainer/releases/download/$V/apptainer_${V#v}_amd64.deb" && apt-get install -y -qq /tmp/a.deb
fi
mkdir -p /root/data

touch /tmp/lab-ready
