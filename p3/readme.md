- install ubuntu server 20.04.3 TLS
- sudo apt install net-tools -y 

10.11.100.136

ssh iel-ferk@10.11.100.116:rootroot




## P3
https://en.sokube.ch/post/gitops-on-a-laptop-with-k3d-and-argocd-1



- Create Cluster
`sudo k3d cluster create mycluster -p "8888:80@loadbalancer"`
`sudo k3d cluster create mycluster --port 8888:80@loadbalancer`

- Create Namespace
`sudo kubectl create namespace argocd`

- Download Argo CD 1.6.2
$ sudo wget https://github.com/argoproj/argo-cd/raw/v1.6.2/manifests/install.yaml
change
```
...
    spec:
      containers:
      - command:
        - argocd-server
        - --staticassets
        - /shared/app
        # Add insecure and argocd as rootpath
        - --insecure
        - --rootpath
        - /argocd
        image: argoproj/argocd:v1.6.2
        imagePullPolicy: Always
...
```


- Install Argo CD
kubectl apply -f install.yaml -n argocd


- Create an Ingress to redirect /argocd to the argocd main service:
```
root@k3d:~# cat ingress.yml 
kind: Ingress
apiVersion: networking.k8s.io/v1
metadata:
  name: ingress-argocd
spec:
  rules:
  - http:
      paths:
      - path: /argocd
        pathType: Prefix
        backend:
          service:
            name: argocd-server
            port:
              number: 80
```


