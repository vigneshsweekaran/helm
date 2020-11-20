# Creating 3 mongo db pods as statefultset using Hemchart

1. Add the mongo db helm repo
helm repo add bitnami https://charts.bitnami.com/bitnami

2. To search for mongo db in bitnami repo
helm search repo bitnami/mongodb

3. Installing mongodb helm chart with 3 replicatset as statefulset
