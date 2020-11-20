# Creating 3 mongo db pods as statefultset using Hemchart

1. Add the mongo db helm repo
helm repo add bitnami https://charts.bitnami.com/bitnami

2. To search for mongo db in bitnami repo
helm search repo bitnami/mongodb

3. Installing mongodb helm chart with 3 replicatset as statefulset
helm install momgodb -f test-mongodb-values.yaml bitnami/mongodb

Output of helm install:
NOTES:
** Please be patient while the chart is being deployed **

MongoDB can be accessed via port 27017 on the following DNS name(s) from within your cluster:

    mongodb-0.mongodb-headless.default.svc.cluster.local
    mongodb-1.mongodb-headless.default.svc.cluster.local
    mongodb-2.mongodb-headless.default.svc.cluster.local


To get the root password run:

    export MONGODB_ROOT_PASSWORD=$(kubectl get secret --namespace default mongodb -o jsonpath="{.data.mongodb-root-password}" | base64 --decode)

To connect to your database, create a MongoDB client container:

    kubectl run --namespace default mongodb-client --rm --tty -i --restart='Never' --image docker.io/bitnami/mongodb:4.4.2-debian-10-r0 --command -- bash

Then, run the following command:
    mongo admin --host "mongodb-0.mongodb-headless.default.svc.cluster.local,mongodb-1.mongodb-headless.default.svc.cluster.local,mongodb-2.mongodb-headless.default.svc.cluster.local," --authenticationDatabase admin -u root -p $MONGODB_ROOT_PASSWORD

4. 
