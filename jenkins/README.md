# Installing Jenkins in kubernetes using Helm chart

* Add the stable helm repo
```
helm repo add stable https://charts.helm.sh/stable
```
* Installing jenkins helm chart
```
helm install jenkins -f values.yaml stable/jenkins
```