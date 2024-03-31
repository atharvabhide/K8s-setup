# Kubernetes Cluster Setup

## Prerequisites
- [Docker](https://docs.docker.com/get-docker/) 
- [Minikube](https://minikube.sigs.k8s.io/docs/start/)

## Steps
1. Use the following command to start minikube and create a cluster with all the nodes.
```bash
./script.sh create
```

2. Use the following command to deploy the application on the cluster (can be accessed through the URL in the terminal).
```bash
./script.sh start
```

3. Use the following command to stop the application and delete the cluster.
```bash
./script.sh stop
```

4. Use the following command to restart the cluster.
```bash
./script.sh restart
```