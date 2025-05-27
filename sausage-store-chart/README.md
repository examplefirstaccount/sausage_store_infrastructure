# Helm Chart for Sausage Store

This Helm chart deploys the full **Sausage Store** application stack, including:

- PostgreSQL
- MongoDB
- Backend service on Spring
- Backend report service on Flask
- Frontend with Ingress

## Structure

This chart is a meta-chart that depends on subcharts for each component:
```
sausage-store-chart/
├── charts/
│   ├── backend/
│   ├── backend_report/
│   ├── frontend/
│   ├── mongodb/
│   └── postgres/
```

## Installation

1. Add your DNS record (or `/etc/hosts`):
    ```
    127.0.0.1 sausage-store.local
    ```

2. Create a namespace:
    ```bash
    kubectl create namespace sausage-store
    ```

3. Install the chart:
    ```bash
    helm install sausage-store ./sausage-store-chart -n sausage-store
    ```

## Access the App

Once deployed, access the frontend at:
**[http://sausage-store.local](http://sausage-store.local)**

Make sure your cluster has an **Ingress controller** installed (e.g., NGINX).

## Configuration

Customize any part of the stack via `values.yaml`. For example:

* Database credentials
* Resource limits
* Ingress host
* Auto-scaling backend report service

## Uninstall

```bash
helm uninstall sausage-store -n sausage-store
```
