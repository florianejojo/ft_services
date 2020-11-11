#! /bin/bash

###
# Lancer Minikube et installer les addons
###
minikube delete
if ! minikube status >/dev/null 2>&1
then
    echo "\033[1;31m->\033[0;31m Minikube is not launched. Starting now... \n"
    minikube start --vm-driver=virtualbox
    eval $(minikube docker-env)
fi
minikube addons enable metrics-server 

###
# Install MetalLB 
###
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
# kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" # On first install only
# kubectl apply -f srcs/config/metallb.yaml
# kubectl apply -f srcs/config/secret.yaml

###
# Construction des containers
###
docker build -t my-image-nginx srcs/nginx/
kubectl apply -f srcs/nginx.yaml

#kubectl get svc | grep nginx-service | cut -d " " -f 15,16,17 | tr -d "\n" | tr -d " "


###
# Dashboard
###
minikube dashboard