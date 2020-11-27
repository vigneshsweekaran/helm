# Installing Jenkins in kubernetes using Helm chart

* Add the stable helm repo
```
helm repo add jenkins https://charts.jenkins.io
helm repo update
```
* Installing jenkins helm chart
```
helm install jenkins -f values.yaml jenkins/jenkins
```
* Official documentaion https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/README.md
