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