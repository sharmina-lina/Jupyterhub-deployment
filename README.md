# Jupyterhub-deployment
README: Deploying JupyterHub with NFS Dynamic Storage Provisioner and MetalLB Load Balancer in Kubernetes Cluster
This guide provides detailed steps for deploying a Kubernetes cluster using Kubespray, setting up MetalLB as a load balancer, configuring NFS as a dynamic storage provisioner, and deploying JupyterHub with Helm charts.

Prerequisites
Cluster Nodes Configuration:

Master Nodes: 4 GB RAM, 2 CPU, 40 GB disk space
Worker Nodes: 2 GB RAM, 2 CPU, 40 GB disk space
Ansible Node: 1 GB RAM, 1 CPU, 40 GB disk space
Internet connectivity and SSH access across nodes
Tools Installed:

Git, Python3, pip, and Ansible
Ensure admin rights (sudo access)
Step 1: Deploy Kubernetes Cluster Using Kubespray
Install Dependencies:

bash
Copy code
sudo apt update
sudo apt install git python3 python3-pip -y
Clone and Configure Kubespray:

bash
Copy code
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip install -r requirements.txt
Create Inventory File:

bash
Copy code
cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(192.168.1.241 192.168.1.242 192.168.1.243) # Replace with your node IPs
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
Manual Host Configuration: Edit inventory/mycluster/hosts.yaml as needed:

yaml
Copy code
all:
  hosts:
    master:
      ansible_host: 192.168.1.241
      ip: 192.168.1.241
      access_ip: 192.168.1.241
    worker1:
      ansible_host: 192.168.1.242
      ip: 192.168.1.242
      access_ip: 192.168.1.242
    worker2:
      ansible_host: 192.168.1.243
      ip: 192.168.1.243
      access_ip: 192.168.1.243
  children:
    kube_control_plane:
      hosts:
        master:
    kube_node:
      hosts:
        worker1:
        worker2:
    etcd:
      hosts:
        master:
Update Cluster Configuration: Edit inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml:

yaml
Copy code
kube_version: v1.29.2
kube_network_plugin: calico
kube_pods_subnet: 10.233.64.0/18
kube_service_addresses: 10.233.0.0/18
Deploy Kubernetes Cluster:

bash
Copy code
ansible-playbook -i inventory/mycluster/hosts.yml --become --become-user=root cluster.yml --user ubuntu
Step 2: Set Up MetalLB Load Balancer
Install MetalLB:

bash
Copy code
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
Configure IP Address Pool: Create yamls/metallb.yaml:

yaml
Copy code
apiVersion: metallb.io/v1beta1
kind: IPAddressPool
metadata:
  name: first-pool
  namespace: metallb-system
spec:
  addresses:
    - 192.168.32.15-192.168.32.25
Apply the configuration:

bash
Copy code
kubectl apply -f yamls/metallb.yaml
Test MetalLB: Deploy and expose NGINX:

bash
Copy code
kubectl create deploy nginx --image nginx
kubectl expose deploy nginx --port 80 --type LoadBalancer
Verify the service:

bash
Copy code
kubectl get services
Step 3: Configure NFS Dynamic Storage Provisioner
Set Up NFS Server:

bash
Copy code
sudo apt update
sudo apt install nfs-kernel-server -y
sudo mkdir -p /srv/nfs/kubedata
sudo chown nobody:nogroup /srv/nfs/kubedata
sudo chmod 777 /srv/nfs/kubedata
echo "/srv/nfs/kubedata *(rw,sync,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports
sudo exportfs -rav
sudo systemctl restart nfs-kernel-server
Install NFS Client on Worker Nodes:

bash
Copy code
sudo apt install -y nfs-common
Deploy NFS Provisioner: Create RBAC, StorageClass, and Deployment files:

yamls/rbac.yaml (Use RBAC configuration)
yamls/class.yaml (Use StorageClass configuration)
yamls/deployment.yaml (Replace server with NFS server IP and path /srv/nfs/kubedata)
Apply the configurations:

bash
Copy code
kubectl apply -f yamls/rbac.yaml
kubectl apply -f yamls/class.yaml
kubectl apply -f yamls/deployment.yaml
Step 4: Deploy JupyterHub
Configure Helm Chart

bash
Copy code
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
helm show values jupyterhub/jupyterhub > yamls/values.yaml
Update values.yaml: Set the storage class:

yaml
Copy code
storage:
  type: dynamic
  class: nfs-client
Install JupyterHub:

bash
Copy code
helm install jupyterhub jupyterhub/jupyterhub --values yamls/values.yaml
Testing
Verify services and pods:
bash
Copy code
kubectl get all
Access JupyterHub using the external IP from MetalLB.
References
Kubespray Installation Guide
MetalLB Documentation
NFS Provisioner GitHub
