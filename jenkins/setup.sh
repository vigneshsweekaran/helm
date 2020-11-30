#!/bin/bash

NAMESPACE="jenkins"
RELEASE_NAME="jenkins"

# Install helm version 3 if not installed
helm version
if [[ $? != 0 ]]; then
    curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash
fi 

# Adding jenkins helm repo and updating the repo
if [[ ! `helm repo list | awk '{if($1 == "jenkins") print "found";}'` == "found" ]]; then
    helm repo add jenkins https://charts.jenkins.io
    helm repo update
fi

# Creating namespace for jenkins
if [[ ! `kubectl get ns | awk -v namespace=$NAMESPACE '{if($1 == namespace) print "found";}'` == "found" ]]; then
    kubectl create ns $NAMESPACE
fi

# Creating glusterfs stotageclass
if [[ ! `kubectl get sc | awk '{if($1 == "glusterfs") print "found";}'` == "found" ]]; then
    kubectl create -f storage-class-glusterfs.yaml
fi

# Creating glusterfs persistent volume cliam foe jenkins pod
if [[ ! `kubectl get pvc | awk '{if($1 == "jenkins") print "found";}'` == "found" ]]; then
    kubectl create -f pvc-glusterfs.yaml
fi

# Install helm chart
if [[ ! `helm list -n $NAMESPACE | awk -v releaseName=$RELEASE_NAME '{if($1 == releaseName) print "found";}'` == "found" ]]; then
    helm install $RELEASE_NAME -f values.yaml jenkins/jenkins -n $NAMESPACE
fi

# Uninstalling jenkins helm release Release
if [[ $* == *uninstall* ]]; then
    helm uninstall $RELEASE_NAME -n $NAMESPACE
fi
