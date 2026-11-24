#!/bin/bash
exec >/var/log/lab-setup.log 2>&1
set -x

export DEBIAN_FRONTEND=noninteractive
apt-get update -qq; apt-get install -y -qq prometheus prometheus-node-exporter >/dev/null
mkdir -p /etc/prometheus/rules
cat > /etc/prometheus/prometheus.yml <<'Y'
global:
  scrape_interval: 10s
  evaluation_interval: 10s
scrape_configs:
  - job_name: prometheus
    static_configs:
      - targets: ['localhost:9090']
Y
systemctl restart prometheus prometheus-node-exporter

touch /tmp/lab-ready
