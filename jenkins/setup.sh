#!/bin/bash

NAMESPACE="jenkins"
RELEASE_NAME="jenkins"

# Adding jenkins helm repo and updating the repo
if [[ ! `helm repo list | awk '{if($1 == "jenkins") print "found";}'` == "found" ]]; then
    helm repo add jenkins https://charts.jenkins.io
    helm repo update
fi

# Creating namespace for jenkins
if [[ ! `kubectl get ns | awk -v namespace=$NAMESPACE '{if($1 == namespace) print "found";}'` == "found" ]]; then
    kubectl create ns $NAMESPACE
fi

# Install helm chart
if [[ ! `helm list -n $NAMESPACE | awk -v releaseName=$RELEASE_NAME '{if($1 == $RELEASE_NAME) print "found";}'` == "found" ]]; then
    helm install $RELEASE_NAME -f values.yaml jenkins/jenkins
fi