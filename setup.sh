#! /bin/bash

###
# Lancer Minikube et installer les addons
###
# minikube delete

# minikube start --vm-driver=virtualbox
minikube start --vm-driver=docker
eval $(minikube docker-env)
minikube addons enable metrics-server

###
# Install MetalLB 
## #

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)" # On first install only
kubectl apply -f srcs/metallb/metallb.yaml # voir si on peut le mettre à la fin de l'autre liste


###
# Construction des containers
###

names="nginx influxdb grafana mysql phpmyadmin wordpress ftps "

for name in $names
do
	docker build -t my-image-$name srcs/$name/
done

###
# Création des déploiements, pods et services
###

for name in $names
do
	kubectl apply -f srcs/$name/$name.yaml
done

###
# Dashboard
###

minikube dashboard