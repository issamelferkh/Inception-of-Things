sudo yum -y install net-tools

curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="--write-kubeconfig-mode=644 --bind-address=192.168.42.110 --flannel-iface=eth1  --node-ip=192.168.42.110 --tls-san 192.168.42.110 --advertise-address=192.168.42.110 --cluster-init" sh -



sleep 5s
sudo cp /var/lib/rancher/k3s/server/node-token /home/token 
sudo chmod 777 /home/token


sudo echo "alias k='kubectl'" > /etc/profile.d/00-aliases.sh

