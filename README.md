# Sausage Store Infrastructure

This repository contains the full infrastructure stack for deploying, monitoring, and managing the **Sausage Store** application.

## Structure

```

├── alertmanager         # Alerting rules and config
├── ansible              # Ansible playbooks for provisioning
├── grafana              # Dashboards and config for Grafana
├── kubernetes           # Raw Kubernetes manifests (optional/legacy)
├── prometheus           # Monitoring configuration
├── sausage-store-chart  # Helm chart for the Sausage Store app
├── terraform            # Infrastructure provisioning (e.g., cloud resources)

```

## Getting Started

1. Provision infrastructure with Terraform (`terraform/`)
2. Configure servers using Ansible (`ansible/`)
3. Deploy monitoring stack (Prometheus, Grafana, Alertmanager)
4. Deploy the app using Helm (`sausage-store-chart/`)

## Monitoring & Alerts

- Dashboards: `grafana/`
- Metrics: `prometheus/`
- Alerts: `alertmanager/`

## Application Chart

Main app stack is packaged as a Helm chart under `sausage-store-chart/`.
