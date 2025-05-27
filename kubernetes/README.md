# Local Kubernetes Setup with k3s

This guide helps you set up a local development environment using **k3s**, **Helm**, and **Ingress** for a sausage store project.

---

## Directory Structure
```txt
kubernetes/
├── backend/              # Java Spring API service
├── backend-report/       # Report service on Flask (MongoDB-based)
├── frontend/             # Angular frontend
├── mongodb/              # Mongo StatefulSet & secrets
├── postgres/             # Postgres StatefulSet & init scripts
└── kustomization.yaml    # Root overlay using Kustomize
```

## Set Up k3s on Ubuntu

1. Install k3s (without Traefik)
```sh
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=traefik" sh -
```

2. Configure kubectl
```sh
export KUBECONFIG=~/.kube/config
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"
echo "export KUBECONFIG=~/.kube/config" >> ~/.bashrc
source ~/.bashrc
```

3. Install NGINX Ingress Controller
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/baremetal/deploy.yaml
```

> Wait 3–5 minutes until the ingress controller is fully ready:
```sh
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx
```

4. Local DNS for testing

Edit your hosts file:
```sh
sudo nano /etc/hosts
```

Add:
```
127.0.0.1 sausage-store.local
```

5. Verify cluster is working

```sh
kubectl get nodes
```

Expected output:
```pgsql
NAME       STATUS   ROLES                  AGE     VERSION
your-host  Ready    control-plane,master   2m      v1.xx.x+k3s
```

## Set Up Useful Dev Tools

- k9s (terminal UI):
```sh
curl -sS https://webinstall.dev/k9s | bash
source ~/.config/envman/PATH.env
k9s
```
- kubectx (switch clusters easily):
```sh
sudo apt install kubectx
```

- Helm (package manager):
```sh
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

## Deploy an application

From within the `kubernetes/` folder:

```sh
kubectl apply -k .
```

## Maintenance

Check cached images:
```sh
sudo crictl images
```

Remove an image:
```sh
sudo crictl rmi <your_image>
```
