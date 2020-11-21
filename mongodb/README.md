# Creating 3 mongo db pods as statefultset using Helmchart

1. Add the mongo db helm repo
```
helm repo add bitnami https://charts.bitnami.com/bitnami
```
2. To search for mongo db in bitnami repo
```
helm search repo bitnami/mongodb
```
3. Installing mongodb helm chart with 3 replicatset as statefulset
```
helm install mongodb -f test-mongodb-values.yaml bitnami/mongodb
```
4. Installing mongodb-express for UI
```
kubectl apply -f test-mongo-express.yaml
```

5. installing Nginx-Ingress-controller helm chart
```
helm repo add ingress-nginx https://kubernetes.github.io/ingress-nginx
helm repo add stable https://charts.helm.sh/stable
helm repo update
helm install nginx-ingress ingress-nginx/ingress-nginx
```
