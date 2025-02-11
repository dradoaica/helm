# Start MicroK8s

```
multipass launch --name microk8s-vm --cpus 4 --memory 8G --disk 40G
multipass shell microk8s-vm
sudo snap install microk8s --classic --channel=1.29/stable
sudo iptables -P FORWARD ACCEPT
multipass info microk8s-vm
microk8s start
microk8s status --wait-ready
microk8s config > $env:LOCALAPPDATA\MicroK8s\config
```

# Turn on the services you want

```
microk8s enable --help
microk8s enable dashboard
microk8s enable hostpath-storage
```

# Access the MicroK8s dashboard

```
microk8s dashboard-proxy
```

# Start using MicroK8s

```
microk8s kubectl get all --all-namespaces
```

# Install helm charts

```
microk8s kubectl create namespace ra2

multipass exec microk8s-vm -- mkdir helms

multipass transfer D:\Projects\helm\charts\conductor-oss-conductor microk8s-vm:helms/conductor-oss-conductor -r
microk8s helm install conductor-oss-conductor ./helms/conductor-oss-conductor -n ra2
microk8s kubectl port-forward -n ra2 service/conductor-oss-conductor 5000:5000
microk8s helm uninstall conductor-oss-conductor -n ra2
multipass exec microk8s-vm -- rm -rf helms/conductor-oss-conductor

multipass transfer D:\Projects\helm\charts\ignite microk8s-vm:helms/ignite -r
microk8s helm install ignite ./helms/ignite -n ra2
microk8s kubectl port-forward -n ra2 service/ignite 10800:10800
microk8s helm uninstall ignite -n ra2
multipass exec microk8s-vm -- rm -rf helms/ignite

multipass transfer D:\Projects\helm\charts\ignite-3 microk8s-vm:helms/ignite-3 -r
microk8s helm install ignite-3 ./helms/ignite-3 -n ra2
microk8s kubectl port-forward -n ra2 service/ignite-3-svc-headless 10800:10800
microk8s helm uninstall ignite-3 -n ra2
multipass exec microk8s-vm -- rm -rf helms/ignite-3
```

# Stop MicroK8s

```
microk8s stop
multipass stop microk8s-vm
multipass delete microk8s-vm
multipass purge
multipass list
```

# Misc

## Refresh MicroK8s certs

```
microk8s refresh-certs --cert ca.crt
microk8s refresh-certs --cert server.crt
microk8s refresh-certs --cert front-proxy-client.crt
multipass exec microk8s-vm -- sudo snap restart microk8s
microk8s config > $env:LOCALAPPDATA\MicroK8s\config
```