#!/bin/bash

echo "Install net-tools (ifconfig cmd)"
sudo yum install net-tools -y

echo "Install KS3 on controller mode"
### https://tferdinand.net/creer-un-cluster-kubernetes-local-avec-vagrant/
curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --bind-address=192.168.42.110 --node-ip=192.168.42.110 --tls-san $(hostname) --advertise-address=192.168.42.110" sh -

echo "Add k alias for all users"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh

### https://kubernetes.io/docs/tasks/configure-pod-container/configure-pod-configmap/
### https://www.suse.com/c/rancher_blog/deploy-an-ingress-controller-on-k3s/
### https://carpie.net/articles/ingressing-with-k3s -> configmap
### https://kind.sigs.k8s.io/docs/user/ingress/

echo "Setup Web App 1"
/usr/local/bin/kubectl create configmap app1-html --from-file /vagrant/confs/app1/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/app1/app1.yaml
# /usr/local/bin/kubectl apply -f /vagrant/confs/app1/dep.yaml
# /usr/local/bin/kubectl apply -f /vagrant/confs/app1/ser.yaml
# /usr/local/bin/kubectl apply -f /vagrant/confs/app1/ing.yaml

echo "Setup Web App 2"
/usr/local/bin/kubectl create configmap app2-html --from-file /vagrant/confs/app2/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/app2/app2.yaml

echo "Setup Web App 3"
/usr/local/bin/kubectl create configmap app3-html --from-file /vagrant/confs/app3/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/app3/app3.yaml






/usr/local/bin/kubectl create configmap app1-html --from-file /vagrant/confs/app1/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/app1/app1.yaml
/usr/local/bin/kubectl create configmap app2-html --from-file /vagrant/confs/app2/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/app2/app2.yaml
/usr/local/bin/kubectl create configmap app3-html --from-file /vagrant/confs/app3/index.html
/usr/local/bin/kubectl apply -f /vagrant/confs/app3/app3.yaml