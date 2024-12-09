kubectl get nodes
kubectl get pods -A
kubectl get deploy -A
kubectl create deployment demo-nginx-kubespray --image=nginx --replicas=2
kubectl expose deployment demo-nginx-kubespray --type NodePort --port=80
kubectl get deployments.apps
kubectl get pods
kubectl get svc demo-nginx-kubespray
curl 10.233.11.130
exit
sshkey-gen
ssh-keygen
cat /root/.ssh/id_rsa.pub
cd .ssh
vi authorized_keys
cd ..
ssh ubuntu@10.196.240.150
cat /root/.ssh/id_rsa.pub
cd .ssh
vi authorized_keys
cd..
cd ..
apt update
apt install git python3 python3-pip -y
git clone https://github.com/kubernetes-sigs/kubespray.git
cd kubespray
pip install -r requirements.txt
ansible --version
cp -rfp inventory/sample inventory/mycluster

CONFIG_FILE=inventory/mycluster/hosts.yaml python3
contrib/inventory_builder/inventory.py ${IPS[@]}
vi inventory/mycluster/hosts.yaml
ls
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
CONFIG_FILE=inventory/mycluster/hosts.yaml python3
ls
cd inventory
ls
cd mycluster
ls
vi hosts.yaml
cd ..
cd inventory
ls
cd sample
ls
cd ..
cp -rfp inventory/sample inventory/mycluster
python3 --version
declare -a IPS=(10.196.241.205 10.196.240.150 10.196.243.214)
CONFIG_FILE=inventory/mycluster/hosts.yaml python3
contrib/inventory_builder/inventory.py ${IPS[@]}
CONFIG_FILE=inventory/mycluster/hosts.yaml python3 contrib/inventory_builder/inventory.py ${IPS[@]}
CONFIG_FILE=inventory/mycluster/hosts.yaml
python3 contrib/inventory_builder/inventory.py ${IPS[@]}
vi inventory/mycluster/hosts.yaml
cd ..
cp -rfp inventory/sample inventory/mycluster
declare -a IPS=(10.196.241.205 10.196.240.150 10.196.243.214)
cd kubespray
ls
cd contrib
ls
cd terraform
ls
cd ..
cd kvm-setup
ls
cd ..
cd docs
ls
cd ..
cd extra_playbooks
ls
cd inventory
ls
cd mycluster
ls
cat inventory.ini
cd sample
ls
cd ..
cd..
cd ..
ls
cd scripts
ls
cd ..
cd inventory
ls
cd mycluster
ls
vi hosts.yaml
cd ..
vi inventory/mycluster/group_vars/k8s_cluster/k8s-cluster.yml
vi inventory/mycluster/group_vars/k8s_cluster/addons.yml
cd inventory
ls
cd mycluster
ls
vi hosts.yaml
cd ..
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu
ansible all -m shell -a 'echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee
/etc/sudoers.d/ubuntu' -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a 'echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee
/etc/sudoers.d/ubuntu' -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "echo 'net.ipv4.ip_forward=1' | sudo tee -a
/etc/sysctl.conf" -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
&& sudo swapoff -a" -i inventory/mycluster/hosts.yml --user ubuntu
ansible all -m shell -a "echo 'net.ipv4.ip_forward=1' | sudo tee -a
/etc/sysctl.conf" -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
&& sudo swapoff -a" -i inventory/mycluster/hosts.yaml --user ubuntu
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-
user=root cluster.yml --user ubuntu
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-user=root cluster.yml --user ubuntu
echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu
ansible all -m shell -a 'echo "ubuntu ALL=(ALL) NOPASSWD:ALL" | sudo tee /etc/sudoers.d/ubuntu' -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "sudo systemctl stop firewalld && sudo systemctl disable firewalld" -i inventory/mycluster/hosts.yaml –-user ubuntu
ansible all -m shell -a "sudo systemctl stop firewalld && sudo systemctl disable firewalld" -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "echo 'net.ipv4.ip_forward=1' | sudo tee -a /etc/sysctl.conf" -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a" -i inventory/mycluster/hosts.yaml --user ubuntu
ansible all -m shell -a "sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab && sudo swapoff -a" -i inventory/mycluster/hosts.yaml --user ubuntu -vvv
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-user=root cluster.yaml --user ubuntu
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-user=root cluster.yml --user ubuntu
vi inventory/mycluster/hosts.yaml
cd ..
ansible -i hosts.yaml all -m setup -a 'filter=ansible_all_ipv4_addresses'
cd kubespray
ansible -i hosts.yaml all -m setup -a 'filter=ansible_all_ipv4_addresses'
vi inventory/mycluster/hosts.yaml
ansible-playbook -i inventory/mycluster/hosts.yaml --become --become-user=root cluster.yml --user ubuntu
cd ..
sudo su -
exit
cat id_rsa.pub
cd .ssh
ls
cd ..
cat ./root
cd ./root
ls
cat /root/.ssh/id_rsa.pub
cd .ssh
vi authorized_keys
kubectl get pods
kubectl get services
kubectl get deployment
kubectl get nodes
helm version
helm -version
helm --version
heml version
hlm version
kubectl cluster-info
helm repo add jupyterhub https://jupyterhub.github.io/helm-chart/
helm repo update
helm show values jupyterhub/jupyterhub > values.yaml
helm upgrade --cleanup-on-fail --install my-jupyter jupyterhub/jupyterhub --namespace jhub --create-namespace --values values.yaml
kubectl --namespace=jhub get pod
kubectl --namespace=jhub get pod -A
kubectl --namespace=jhub get pod
kubectl --namespace=jhub describe pod hub-69b76d8d57-q5sw2
kubectl get pods -n jhub
kubectl get servcies -n jhub
kubectl get pods -n jhub
kubectl --namespace=jhub describe pod hub-69b76d8d57-q5sw2
kubectl describe nodes
kubectl --namespace=jhub get pvc
kubectl --namespace=jhub describe pvc hub-db-dir
kubectl get pv
touch pv.yaml
vi pv.yaml
kubectl apply -f pv.yaml
kubectl --namespace=jhub get pvc
kubectl --namespace=jhub get pods
kubectl --namespace=jhub logs hub-69b76d8d57-q5sw2
kubectl --namespace=jhub get pods
helm upgrade --cleanup-on-fail --install my-jupyter jupyterhub/jupyterhub --namespace jhub --create-namespace --values values.yaml
kubectl --namespace=jhub get pod
kubectl --namespace=jhub logs hub-699777d677-9f2dn
kubectl --namespace=jhub describe pod hub-699777d677-9f2dn
kubectl --namespace=jhub logs hub-699777d677-9f2dn
kubectl --namespace=jhub get pvc hub-db-dir
kubectl --namespace=jhub get pods
kubectl describe pod hub-699777d677-9f2dn
kubectl --namespace=jhub describe pod hub-699777d677-9f2dn
kubectl --namespace=jhub get pods
kubectl --namespace=jhub logs hub-699777d677-9f2dn
ls -l /srv/jupyterhub/jupyterhub.sqlite
helm repo add jupyterhub https://hub.jupyter.org/helm-chart/
helm uninstall my-jupyter --namespace jhub
kubectl --namespace=jhub get pods
kubectl get pods
ls
helm repo update
helm upgrade --cleanup-on-fail   --install my-jupyter jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --values config.yaml
helm repo remove jupyterhub
helm repo add jupyterhub https://hub.jupyter.org/helm-chart/
helm repo update
helm upgrade --cleanup-on-fail   --install version 1 jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --version=4.0.0   --values config.yaml
helm list
helm upgrade --cleanup-on-fail   --install my-jupyter jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --version 4.0.0   --values config.yaml
ls -l
helm upgrade --cleanup-on-fail   --install my-jupyter jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --version 4.0.0   --values values.yaml
kubectl --namespace=jhub get pod
ls
cd kube-manifests
ls
cd kubernetes
ls
cd ..
kubectl --namespace=jhub get pod
kubectl --namespace=jhub get pv
kubectl --namespace=jhub get pvc
kubectl install -f pv.yaml
helm show values jupyterhub/jupyterhub > values.yaml
helm upgrade --cleanup-on-fail   --install my-jupyter jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --version 4.0.0   --values values.yaml
kubectl --namespace=jhub get pod
kubectl --namespace=jhub edit pvc hub-db-dir
kubectl --namespace=jhub apply -f values.yaml
kubectl --namespace=jhub apply -f value.yaml
helm upgrade --cleanup-on-fail   --install my-jupyter jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --version 4.0.0   --values values.yaml
kubectl get pods
kubectl --namespace=jhub get pod
kubectl --namespace=jhub get pvc
ls
kubectl --namespace=jhub apply pv.yaml
kubectl --namespace=jhub -f apply pv.yaml
kubectl --namespace=jhub apply -f pv.yaml
kubectl --namespace=jhub get pvc
kubectl --namespace=jhub get pv
kubectl --namespace=jhub get pods
helm show values jupyterhub/jupyterhub > values.yaml
kubectl --namespace=jhub edit pvc hub-db-dir
helm upgrade --cleanup-on-fail   --install my-jupyter jupyterhub/jupyterhub   --namespace jhub   --create-namespace   --version 4.0.0   --values values.yaml
kubectl --namespace=jhub get pod
kubectl --namespace=jhub get pv
kubectl --namespace=jhub get pvc
kubectl --namespace=jhub edit pvc hub-db-dir
kubectl --namespace=jhub get pvc hub-db-dir -o yaml > hub-db-dir.yaml
nano hub-db-dir.yaml
kubectl --namespace=jhub apply -f hub-db-dir.yaml
kubectl --namespace=jhub delete pvc hub-db-dir
kubectl --namespace=jhub apply -f hub-db-dir.yaml
kubectl get pvc
kubectl --namespace=jhub get pvc
kubectl --namespace=jhub get pv
kubectl --namespace=jhub get pods
kubectl --namespace=jhub describe pv hub-db-pv
kubectl --namespace=jhub delete pv hub-db-pv
ls
kubectl apply -f pv.yaml
kubectl --namespace=jhub get pvc hub-db-dir
kubectl --namespace=jhub get pv
kubectl --namespace=jhub get pvc
kubectl --namespace=jhub get pod
kubectl --namespace=jhub logs hub-97df6d87c-sm7nb
kubectl --namespace=jhub exec -it hub-97df6d87c-sm7nb -- /bin/bash
kubectl get pods
helm uninstall my-jupyter --namespace jhub
kubectl get pods
kubectl get nodes -o wide
kubectl get all
kubectl create deploy iginx --image nginx
kubectl get all
kubectl expose deploy nginx --port 80 --type LoadBalancer
kubectl expose deploy iginx --port 80 --type LoadBalancer
kubectl get all
kubectl delete svc iginx
kubectl get all
ip a s
get nodes -o wide
kubectl get nodes -o wide
which sipcalc
sipcalc 192.168.32.183/24
apt install sipcalc
sipcalc 192.168.32.183/24
kubectl -n kube-system get all
kubectl -n kube-system get cm
kubectl -n kube-system describe cm kube-proxy | LESS
kubectl -n kube-system describe cm kube-proxy | less
kubectl edit configmap -n kube-system kube-proxy
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.14.8/config/manifests/metallb-native.yaml
kubectl -n metallb-system get all
clear
vi /tmp/metallb.yaml
kubectl create -f /tmp/metallb.yaml
kubectl expose deploy nginx --port 80 --type LoadBalancer
kubectl expose deploy iginx --port 80 --type LoadBalancer
kubectl get svc
which w3m
w3m 192.168.32.15
apt install w3m
w3m 192.168.32.15
kubectl get pods
kubectl -n metallb-system get all
clear 
kubectl -n operations get all
git clone https://github.com/justmeandopensource/kubernetes
cd kubernetes/vagrant-provisioning
vagrant up
cd ..
ls
cd yamls
cd nfs-provisioner
ls
sudo pacman -S nfs-utils
pacman -S nfs-utils
apt install pacman
pacman -S nfs-utils
sudo pacman -S nfs-utils
sudo apt update
sudo apt install nfs-common -y
pacman -S nfs-utils
showmount --version
clear
mkdir /srv/nfs/kubedata -p
chown nobody: /srv/nfs/kubedata
sudo vi /etc/exports
sudo systemctl enable --now nfs-server
sudo apt install nfs-kernel-server -y
sudo systemctl start nfs-kernel-server
sudo systemctl enable nfs-kernel-server
clear
sudo vi /etc/exports
sudo exportfs -arv
sudo vi /etc/exports
sudo exportfs -arv
sudo exportfs -v
cd ..
ssh root@node2
kubectl get nodes
ssh ubuntu@node1
ssh ubuntu@node2
ssh ubuntu@node1
cd kubernetes
cd yaml
cd yamls
ls
cd nfs-provisioner
kubectl create -f rbac.yaml
clear
kubectl create -f default-cs.yaml
kubectl create -f default_cs.yaml
ls
kubectl create -f default-sc.yaml
vi deployment.yaml
kubectl create -f deployment.yaml
kubectl get pods
cd ..
ls
kubectl get sc
vi 4-pvc-nfs.yaml
kubectl -f 4-pvc-nfs.yaml
kubectl create -f 4-pvc-nfs.yaml
clear
kubectl get pv,pvc
kubectl get pods
kubectl delete -f 4-pvc-nfs.yaml
kubectl delete -f rbac.yaml
cd nfs-provisioner
kubectl delete -f rbac.yaml
kubectl delete -f deployment.yaml default-sc.yaml
kubectl delete -f deployment.yaml -f default-sc.yaml
kubectl get pods
clear
cd ..
cd /tmp
vi rbac.yaml
kubectl create -f rbac.yaml
vi class.yaml
kubectl create -f class.yaml
kubectl get sc
vi deployment.yaml
kubectl create -f deployment.yaml
kubectl get pods
uptime
cd ..
cd kubernetes/yamls
cd kubernetes
ls
exit
ls
cd kubernetes/yamls
ls
vi 4-pvc-nfs.yaml
kubectl create -f 4-pvc-nfs.yaml
kubectl get pv,pvc
kubectl delete -f 4-pvc-nfs.yaml
kubectl get pv,pvc
cd ..
kubectl get all
kubectl get sc
clear
helm version
helm repo add jupyterhub https://hub.jupyter.org/helm-chart/
help repo update
helm repo update
helm repo list
helm search repo jupyterhub
vi /tmp/jupyterhub.yaml
openssl rand -hex 32

kubectl get all
clear
helm install jupyterhub jupyterhub/jupyterhub --values /tmp/jupyterhub.yaml
sudo helm install jupyterhub/jupyterhub --values /tmp/jupyterhub.yaml
sudo helm install jupyterhub jupyterhub/jupyterhub --values /tmp/jupyterhub.yaml
vi /tmp/jupyterhub.yaml
sudo helm install jupyterhub jupyterhub/jupyterhub --values /tmp/jupyterhub.yaml
kubectl --namespace=default get pod
kubectl get all
kubectl --namespace=default port-forward service/proxy-public 8080:http
exit
