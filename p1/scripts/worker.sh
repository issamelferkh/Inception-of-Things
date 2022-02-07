#!/bin/bash

echo "Upgrade OS"
# sudo yum upgrade -y

echo "Update OS"
# sudo yum update -y

echo "Install net-tools (ifconfig cmd)"
sudo yum install net-tools -y

echo "Copy node-token from S to SW"
scp -P 222 vagrant@192.168.42.110:/home/vagrant/node-token vagrant@192.168.42.110:/home/vagrant/node-token
# export K3S_TOKEN=`cat $TOKEN_FILE`

echo "Install KS3 on worker mode"
curl -sfL https://get.k3s.io | K3S_URL=https://192.168.42.100:6443 K3S_TOKEN=$K3S_TOKEN sh -

echo "Add k alias for all users"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh

echo "[machine : $(hostname)] has been setup succefully!"