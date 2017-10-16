#!/bin/bash -x

if minikube status | grep -q Stopped; then minikube start; fi

eval $(minikube docker-env)

kubectl get all

kubectl create -f mysql-service.yaml
kubectl create -f mysql-pvc.yaml
kubectl create -f mysql-deployment.yaml

kubectl get all
kubectl run -it --rm --image=mariadb:10.3 --restart=Never mysql-client -- mysql -h mysql -phadoop -e "show databases;"
