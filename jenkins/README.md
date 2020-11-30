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
### Add the stable helm repo
  ```
  helm repo add jenkins https://charts.jenkins.io
  helm repo update
  ```
### Installing jenkins helm chart
  ```
  helm install jenkins -f values.yaml jenkins/jenkins
  ```

## Official documentaion 

https://github.com/jenkinsci/helm-charts/blob/main/charts/jenkins/README.md
