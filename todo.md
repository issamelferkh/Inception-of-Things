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
  sudo apt-get update -y
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



