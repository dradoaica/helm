# Install MicroK8s

## Via multipass with a static network

```
New-VMSwitch -SwitchName "MyStaticSwitch" -SwitchType Internal
Get-NetAdapter -Name "vEthernet (MyStaticSwitch)" -- e.g., ifIndex 52
New-NetIPAddress -IPAddress 192.168.85.1 -PrefixLength 24 -InterfaceIndex 52
New-NetNat -Name "MyNatNetwork" -InternalIPInterfaceAddressPrefix 192.168.85.0/24
multipass networks

# microk8s-vm-my-static-switch.yaml
write_files:
  - path: /etc/netplan/99-custom.yaml
    content: |
      network:
        ethernets:
          eth1:
            dhcp4: false
            addresses:
              - 192.168.85.3/24
        version: 2
runcmd:
  - netplan apply

multipass launch --name microk8s-vm --cpus 4 --memory 8G --disk 40G --network name=MyStaticSwitch --cloud-init microk8s-vm-my-static-switch.yaml
multipass shell microk8s-vm
sudo snap install microk8s --classic --channel=1.30/stable
echo '--node-ip=192.168.85.3' | sudo tee -a /var/snap/microk8s/current/args/kubelet
sudo snap restart microk8s
sudo snap install microk8s-integrator-windows
sudo iptables -P FORWARD ACCEPT
exit
microk8s config | ForEach-Object { $_ -replace 'https://.*:16443', 'https://192.168.85.3:16443' } > $env:LOCALAPPDATA\MicroK8s\config
microk8s status --wait-ready
```

## Or via microk8s

```
microk8s install --cpu=4 --mem=8 --disk=40 --channel=1.30/stable
microk8s status --wait-ready
```

## Turn on the services you plan to use

```
microk8s enable --help
microk8s enable dashboard
microk8s enable hostpath-storage
```

# Re/Start MicroK8s

```
microk8s start
microk8s status --wait-ready
microk8s kubectl get all --all-namespaces
```

# Access the MicroK8s dashboard

```
microk8s dashboard-proxy
```

# Install helm charts

```
microk8s kubectl create namespace ra2

multipass exec microk8s-vm -- mkdir helms

multipass transfer D:\Projects\helm-charts\charts\conductor-oss-conductor microk8s-vm:helms/conductor-oss-conductor -r
microk8s helm install conductor-oss-conductor ./helms/conductor-oss-conductor -n ra2
microk8s kubectl port-forward -n ra2 service/conductor-oss-conductor 5000:5000
microk8s helm uninstall conductor-oss-conductor -n ra2
multipass exec microk8s-vm -- rm -rf helms/conductor-oss-conductor

multipass transfer D:\Projects\helm-charts\charts\ignite microk8s-vm:helms/ignite -r
microk8s helm install ignite ./helms/ignite -n ra2
microk8s kubectl port-forward -n ra2 service/ignite-svc-headless 10800:10800
microk8s helm uninstall ignite -n ra2
multipass exec microk8s-vm -- rm -rf helms/ignite

multipass transfer D:\Projects\helm-charts\charts\ignite-3 microk8s-vm:helms/ignite-3 -r
microk8s helm install ignite-3 ./helms/ignite-3 -n ra2
microk8s kubectl port-forward -n ra2 service/ignite-3-svc-headless 10800:10800
microk8s helm uninstall ignite-3 -n ra2
multipass exec microk8s-vm -- rm -rf helms/ignite-3
```

# Stop MicroK8s

```
microk8s stop
```

# Uninstall MicroK8s

## Via multipass

```
multipass delete microk8s-vm
multipass purge
```

## Or via microk8s

```
microk8s uninstall
```

# Misc

## Refresh MicroK8s certs

```
microk8s refresh-certs --cert ca.crt
microk8s refresh-certs --cert server.crt
microk8s refresh-certs --cert front-proxy-client.crt
multipass exec microk8s-vm -- sudo snap restart microk8s
microk8s config | ForEach-Object { $_ -replace 'https://.*:16443', 'https://192.168.85.3:16443' } > $env:LOCALAPPDATA\MicroK8s\config
```
