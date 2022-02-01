## Part 1
- setup 2 machines
- using the latest stable version of CentOS as OS.
- esources:
  - 1 CPU
  - 512 MB of RAM (or 1024).

- machine name: login of someone of team
- hostname first machine must followed by 'S' (Server)
- hostname second machine must followed by SW (Server Worker)


- Have a dedicated IP on the eth1 interface. 
  - The IP of the first machine (Server) will be 192.168.42.110
  - The IP of the second machine (ServerWorker) will be 192.168.42.111

- 



- The machines must be run using Vagrant.
- Be able to connect with SSH on both machines with no password

- You must install K3s on both machines:
  - In the first one (Server), it will be installed in controller mode.
  - In the second one (ServerWorker), in agent mode.

- install kubectl 