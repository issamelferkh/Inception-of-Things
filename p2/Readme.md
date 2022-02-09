# Part 2

## Terminology
- Resources
  - https://levelup.gitconnected.com/a-guide-to-k3s-ingress-using-traefik-with-nodeport-6eb29add0b4b
  - https://www.getambassador.io/learn/kubernetes-ingress/kubernetes-ingress-nodeport-load-balancers-and-ingress-controllers/
  - https://medium.com/google-cloud/kubernetes-101-pods-nodes-containers-and-clusters-c1509e409e16



- Ingress: take incoming traffic from external and determining to which container the traffic should be directed.


- Cluster: servers managed by Kubernetes that run Pods.
- Ingress: Kubernetes Ingress exposes HTTP/HTTPS traffic from outside the Cluster to Services within the cluster.
- Ingress Controller: An app responsible for responding to input (ingress) requests 
- Service: Kubernetes Service is a way to expose an app running in Pods. Implementation of service include NodePort + ClusterIP
- Pod: A group of one or more containers that share network and storage resources.


- Kubernetes Ingress Requirement
  - Ingress Controler
  - Ingress

