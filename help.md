## Cluster
- Delete all resources
`kubectl delete all --all`

## NameSpace
- Get NS (namespaces)
`kubectl get namespaces` or `kubectl get ns`

- Create New ns
`kubectl create ns test`

- Delete ns
`kubectl delete ns test`
- Delete all resources in ns
`kubectl delete all --all -n {default}`






## Pods
- Get all pods in all ns
`kubectl get pods --all-namespaces`
- Get all pods for one ns
`get all -n dev`

- Delete pod
`kubectl delete pods app1-64d5454898-9hp9w`

- Delet all pods in ns
`kubectl delete --all pods --namespace=foo`

- Log pod
`k logs -f pod/app2-69557c7989-5vjh6 -n kube-system`


## Service

## Ingress
- Get ingress
`kubectl describe ingress <ingress name>`

- Delete Ingress
`kubectl delete ingress app3-ingress`




## k3d Cluser
https://k3d.io/v5.0.1/usage/commands/k3d_cluster_list/
- K3d list cluster
`sudo k3d cluster list`
- K3d delete cluster
`k3d cluster delete p3`

