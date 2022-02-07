# #!/bin/bash

echo "Upgrade OS"
# sudo yum upgrade -y

echo "Update OS"
# sudo yum update -y

echo "Install net-tools (ifconfig cmd)"
sudo yum install net-tools -y


echo "Install KS3 on controller mode"
curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644

echo "Copy controler node-token to home"
sudo cp /var/lib/rancher/k3s/server/node-token ~/.

echo "Change node-token access permissions"
sudo chmod ~/node-token

echo "Expose TOKEN_FILE env var to share node-token with SW"
export TOKEN_FILE="~/node-token"

echo "Add k alias for all users"
### https://askubuntu.com/questions/610052/how-can-i-preset-aliases-for-all-users
echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh

echo "[machine : $(hostname)] has been setup succefully!"






