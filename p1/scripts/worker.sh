sudo yum -y install net-tools


sudo curl -sfL https://get.k3s.io | INSTALL_K3S_EXEC="agent --server https://192.168.42.110:6443 --flannel-iface=eth1 --token-file /vagrant/scripts/token --node-ip=192.168.42.111" sh -


sudo echo "alias k='kubectl'" > /etc/profile.d/00-aliases.sh
