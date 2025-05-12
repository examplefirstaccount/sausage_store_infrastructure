# Grafana

1. Add Helm Repositories

```bash
helm repo add grafana https://grafana.github.io/helm-charts
helm repo update
```

2. Create a Namespace

```bash
kubectl create namespace monitoring
```

3. Install Loki and Promtail

```bash
helm upgrade --install loki grafana/loki-stack -n monitoring
```

4. Install Grafana

```bash
helm install grafana grafana/grafana -n monitoring -f values.yaml
```

To access Grafana locally add the following to /etc/hosts:
```text
192.168.100.116 grafana.localhost
```

or

```text
127.0.0.1 grafana.localhost
```

Now your Grafana is available by `http://grafana.localhost:<cluster-ingress-controller-port>` (default port for cluster ingress controller is 80)
