# Installing Jenkins in kubernetes using Helm chart

# Script Way
### Install the jenkins helm chart using shell script

All dependecies are taken care in this shell scipt, like creating namespace, installing helm if not present, adding jenkins helm repo if not added, creating storageclass if not created and installs jenkins helm chart
```
./setup.sh
```

### Uninstall a jenkins helm release using shell script
```
./setup.sh uninstall
```

# Manual Way
### Creating namespace for jenkins
```
kubectl create ns jenkins
```
### Add the stable helm repo
```
helm repo add jenkins https://charts.jenkins.io
helm repo update
```
### Creating glusterfs storageclass, for this glusterfs and heketi cluster should be deployed
```
kubectl create -f storage-class-glusterfs.yaml
```
### Installing jenkins helm chart
```
helm install jenkins -f values.yaml jenkins/jenkins -n jenkins
```

## Official documentaion 

https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/README.md
