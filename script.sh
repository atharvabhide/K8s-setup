#!/bin/bash

modes="start\n stop\n restart\n create"
mode=$1

if [ "$mode" == "" ]; then
    echo -e $"Invalid mode \nPlease enter one of the following mode:\n${modes}"
elif [ "$mode" == "create" ]; then 
    minikube start --driver=docker
    kubectl apply -f mongo-secret.yaml
    kubectl apply -f mongo-config.yaml
    kubectl apply -f mongo.yaml
    kubectl apply -f webapp.yaml
elif [ "$mode" == "start" ]; then
    minikube service webapp-service
elif [ "$mode" == "stop" ]; then
    kubectl delete -f mongo-secret.yaml
    kubectl delete -f mongo-config.yaml
    kubectl delete -f mongo.yaml
    kubectl delete -f webapp.yaml
    minikube stop
elif [ "$mode" == "restart" ]; then
    kubectl delete -f mongo-secret.yaml
    kubectl delete -f mongo-config.yaml
    kubectl delete -f mongo.yaml
    kubectl delete -f webapp.yaml
    minikube stop
    minikube start --driver=docker
    kubectl apply -f mongo-secret.yaml
    kubectl apply -f mongo-config.yaml
    kubectl apply -f mongo.yaml
    kubectl apply -f webapp.yaml
else
    echo -e $"Invalid mode \nPlease enter one of the following mode:\n${modes}"
fi