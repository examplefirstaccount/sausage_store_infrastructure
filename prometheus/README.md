# Prometheus Monitoring Setup

This repository contains a Helm values configuration for deploying Prometheus with Alertmanager and Telegram alerting support in a Kubernetes cluster.

## Features

- Prometheus with custom alerting and recording rules
- Alertmanager enabled with Telegram integration
- Kubernetes Pod scraping configuration
- Exposed via Ingress at `http://prometheus.local`

## Prerequisites

- Helm installed
- Kubernetes cluster with `nginx` Ingress controller
- Namespace `monitoring` created:  
```bash
  kubectl create namespace monitoring
```

## Installation

1. Add Prometheus Helm repo:

   ```bash
   helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
   helm repo update
   ```

2. Install Prometheus with custom config:

   ```bash
   helm install prometheus prometheus-community/prometheus -n monitoring -f values.yaml
   ```

## Access Prometheus

Ensure DNS or local `/etc/hosts` maps `prometheus.local` to your cluster, then visit:

```
http://prometheus.local
```

## Alerts

Alerts are defined in `alerting_rules.yml`. Critical alerts send notifications to a Telegram chat using the provided bot token and chat ID.
