## Part 1
- [x] setup 2 machines
- [x] using the latest stable version of CentOS as OS.
  - [x] 1 CPU
  - [x] 512 MB of RAM (or 1024).
- [x] machine name: login of someone of team
  - [x] hostname first machine must followed by 'S' (Server)
  - [x] hostname second machine must followed by SW (Server Worker)
- [x] Have a dedicated IP on the eth1 interface. 
  - [x] The IP of the first machine (Server) will be 192.168.42.110
  - [x] The IP of the second machine (ServerWorker) will be 192.168.42.111
- [x] The machines must be run using Vagrant.
- [x] Be able to connect with SSH on both machines with no password
- [ ] You must install K3s on both machines:
  - [ ] In the first one (Server), it will be installed in controller mode.
  - [ ] In the second one (ServerWorker), in agent mode.
- [ ] install kubectl 


- alias not working

- worker issue
- copy node-token issue
- env var issue


## Part 2
- [x] need one VM with Centos and k3s server mode

- [x] You will set up 3 web apps that will run in your K3s instance.
- [x] be able to access them depending on the HOST used when making a request to IP 192.168.42.110.
- [x] The name of this machine will be your login followed by S (e.g., wilS if your login is wil).

- [x] When a client inputs the ip 192.168.42.110 with the HOST app1.com, the server must display the app1.
- When the HOST app2.com is used, the server must display the app2.
- Otherwise, the app3 will be selected by default.

- As you can see, application number 2 has 3 replicas. Adapt your configuration to create the replicas.

curl -H "HOST:app1.com" 192.168.42.110



## Part 3

### Install Tools
- Install net-tools
`sudo apt install net-tools -y`


- Install Docker
  - Uninstall old versions if existe
  `sudo apt-get remove docker docker-engine docker.io containerd runc`
  - Update apt package and install packages to allow apt use repository over HTTPS:
  ```
  sudo apt-get update
  sudo apt-get install ca-certificates curl gnupg lsb-release
    ```
  - Add Docker’s official GPG key:
  `curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg`
  - Use the following command to set up the stable repository
  ```
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  ```
  - Install Docker Engine
  ```
    sudo apt-get update
    sudo apt-get install docker-ce docker-ce-cli containerd.io -y
  ```

- Install K3D on your VM
`sudo wget -q -O - https://raw.githubusercontent.com/rancher/k3d/main/install.sh | bash`

- Install Kubectl binary with curl on Linux
https://kubernetes.io/docs/tasks/tools/install-kubectl-linux/
  - Download latest release
  `cd /tmp/`
  `curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"`
  - Install kubectl
  `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`

```
Note:
If you do not have root access on the target system, you can still install kubectl to the ~/.local/bin directory:

chmod +x kubectl
mkdir -p ~/.local/bin/kubectl
mv ./kubectl ~/.local/bin/kubectl
# and then append (or prepend) ~/.local/bin to $PATH
```



### Add k Alias
echo "Add k alias for all users"
echo "alias k='kubectl'" >> /etc/profile.d/00-aliases.sh

### Create Cluster
sudo k3d cluster create p3 --port 8080:443@loadbalancer --port 8888:30080@loadbalancer
```s
iel-ferk@k3d:~$ sudo k3d cluster create mycluster
INFO[0000] Prep: Network                                
INFO[0000] Created network 'k3d-mycluster'              
INFO[0000] Created image volume k3d-mycluster-images    
INFO[0000] Starting new tools node...                   
INFO[0001] Creating node 'k3d-mycluster-server-0'       
INFO[0002] Pulling image 'docker.io/rancher/k3d-tools:5.3.0' 
INFO[0003] Pulling image 'docker.io/rancher/k3s:v1.22.6-k3s1' 
INFO[0005] Starting Node 'k3d-mycluster-tools'          
INFO[0009] Creating LoadBalancer 'k3d-mycluster-serverlb' 
INFO[0012] Pulling image 'docker.io/rancher/k3d-proxy:5.3.0' 
INFO[0016] Using the k3d-tools node to gather environment information 
INFO[0016] HostIP: using network gateway 172.18.0.1 address 
INFO[0016] Starting cluster 'mycluster'                 
INFO[0016] Starting servers...                          
INFO[0016] Starting Node 'k3d-mycluster-server-0'       
INFO[0021] All agents already running.                  
INFO[0021] Starting helpers...                          
INFO[0021] Starting Node 'k3d-mycluster-serverlb'       
INFO[0028] Injecting records for hostAliases (incl. host.k3d.internal) and for 2 network members into CoreDNS configmap... 
INFO[0030] Cluster 'mycluster' created successfully!    
INFO[0031] You can now use it like this:                
kubectl cluster-info
```





### Create two namespaces
- 1st -> argocd -> will be dedicated to Argo CD
- 2nd -> dev -> will contain an application
```
sudo kubectl create namespace argocd
sudo kubectl create namespace dev
```






- App will auto deploy by Argo CD using GitHub repo
- App deployed must have 2 diff verions

- You must be able to change the version from your public Github repo, then check that the app has been correctly updated.




### Todo 
- [!] write a script to install every necessary packages and tools during your defense.




`sudo kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml`
`sudo kubectl patch svc argocd-server -n argocd -p '{"spec": {"type": "LoadBalancer"}}'`
sudo kubectl -n argocd patch secret argocd-secret \
    -p '{"stringData": {"admin.password": "$2a$10$mivhwttXM0U5eBrZGtAG8.VSRL1l9cZNAmaSaqotIzXRBRwID1NT.",
        "admin.passwordMtime": "'$(date +%FT%T)'"
    }}'

argocd login localhost:10443 --username admin --password admin --insecure

