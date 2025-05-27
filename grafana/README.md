# Grafana Setup for Monitoring

This module contains Helm configuration for deploying **Grafana** as part of the Sausage Store monitoring stack.

## Overview

Grafana provides visualization for metrics and logs, integrating with **Prometheus** and **Loki**. This setup includes local access via Ingress and persistent storage.

---

## Deployment Instructions

### 1. Add Helm Repositories

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

### 2. Create Monitoring Namespace

```bash
kubectl create namespace monitoring
```

### 3. Install Loki and Promtail (for log collection)

```bash
helm upgrade --install loki grafana/loki-stack -n monitoring
```

### 4. Install Grafana

```bash
helm install grafana grafana/grafana -n monitoring -f values.yaml
```

---

## Accessing Grafana Locally

Add the following entry to your `/etc/hosts` file:

```text
127.0.0.1 grafana.localhost
```

Now you can access Grafana at:

```text
http://grafana.localhost
```

> 🔸 Default ingress controller port is usually `80`. Make sure it's exposed correctly.

---

## Default Credentials

* **Username**: `admin`
* **Password**: `admin123` *(⚠️ Change this in production!)*

---

## Configuring Data Sources

After logging into Grafana:

1. Navigate to **Settings → Data Sources**.
2. Add:

   * **Prometheus**: `http://prometheus-server.monitoring.svc.cluster.local`
   * **Loki**: `http://loki:3100`

This enables both metric and log visualization from your Kubernetes workloads.

---

## Notes

* The `values.yaml` file handles persistence, ingress, and basic admin setup.
* Uncomment and customize the `datasources` block in `values.yaml` to preconfigure data sources automatically on deployment.
