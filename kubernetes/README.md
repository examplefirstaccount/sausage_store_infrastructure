# Phase 1: Set Up Your Local k3s Cluster on Ubuntu

## Mandatory

Install k3s:
```sh
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--disable=traefik" sh -
```

Set up propper configuration:
```sh
export KUBECONFIG=~/.kube/config
mkdir ~/.kube 2> /dev/null
sudo k3s kubectl config view --raw > "$KUBECONFIG"
chmod 600 "$KUBECONFIG"
echo "export KUBECONFIG=~/.kube/config" >> ~/.bashrc
source ~/.bashrc
```

Install Nginx Ingress Controller:
```sh
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.12.1/deploy/static/provider/baremetal/deploy.yaml
```

Wait 3-5 minnutes untill `ingress-nginx-controller` is Ready
```sh
kubectl get pods -n ingress-nginx
kubectl get svc -n ingress-nginx
```

Add `/etc/hosts` entries To fake DNS locally:
```sh
sudo nano /etc/hosts
```

Add:
```
127.0.0.1 sausage-store.local
```

## Optional

Test if all is working:
```sh
kubectl get nodes
```

You should see something like:
```pgsql
NAME       STATUS   ROLES                  AGE     VERSION
your-host  Ready    control-plane,master   2m      v1.xx.x+k3s
```

Install k9s (UI for Kubernetes in Terminal):
```sh
curl -sS https://webinstall.dev/k9s | bash
source ~/.config/envman/PATH.env
k9s
```

Install kubectx (manage multiple clusters):
```sh
sudo apt install kubectx
```

Install helm:
```sh
curl -fsSL -o get_helm.sh https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3
chmod 700 get_helm.sh
./get_helm.sh
```

# Dockerfile for frontend

```Dockerfile
# build
FROM node:16.20.0-alpine3.18 AS builder
WORKDIR /usr/src/app
COPY . .
RUN npm install && \
    npm run build

# release
FROM nginx:1.25-alpine
COPY --from=builder /usr/src/app/dist/frontend /usr/share/nginx/html
EXPOSE 8080
```

# Apply manifests

```sh
kubectl apply -k .
```

# If you will need to access cached images of k3s

```sh
sudo crictl images
sudo crictl rmi <your_image>
```
