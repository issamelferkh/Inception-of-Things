# Inception-of-Things
This project aims to introduce you to kubernetes from a developer perspective. You will have to set up small clusters and discover the mechanics of continuous integration. At the end of this project you will be able to have a working cluster in docker and have a usable continuous integration for your applications.


## Resources
- https://www.youtube.com/watch?v=89k4FV6TTlQ
- https://gitlab.com/xavki/presentations-kubernetes
- https://hub.docker.com/r/paulbouwer/hello-kubernetes



## Part 1 
### Setup 2 node cluster on k3s
#### Install k3s
- `curl -sfL https://get.k3s.io | sh -`
- Issue permission denided
  - `curl -sfL https://get.k3s.io | sh -s - --write-kubeconfig-mode 644`
#### Verif Installation
- k3s kubectl get node
or
- k node -o wide

#### Deploy simple app
- deploy nginx web app
  - `kubectl run nginx --image nginx:alpine`
- Expose app with the following cmd
k3s kubectl expose deployment nginx \
--port 80 \
--target-port 80 \
--type ClusterIP \
--selector=run=nginx \
--name nginx


`k3s kubectl expose deployment nginx --port 80 --target-port 80 --type ClusterIP --selector=run=nginx --name nginx`

#### Install Server Worker nodes
To install worker node and add them to the cluster I need to add those env vars, K3S_URL and K3S_TOKEN
curl -sfL https://get.k3s.io | K3S_URL=https://<server>:6443 K3S_TOKEN=<token> sh -
<server> = 
<token> = K101f721423e4ecb1226987ea9c06756e52b035ccb2d36e67f6c20fa86bd2f72645::server:0bc1f40a4709423047a081a9601db1f5

sudo cat /var/lib/rancher/k3s/server/node-token
K101f721423e4ecb1226987ea9c06756e52b035ccb2d36e67f6c20fa86bd2f72645::server:0bc1f40a4709423047a081a9601db1f5