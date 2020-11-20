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
minikube addons enable metallb

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

names="nginx mysql phpmyadmin wordpress" # influxdb grafana mysql phpmyadmin telegraf ftps

for name in $names
do
	docker build -t my-image-$name srcs/$name/
done

###
# Création des déploiements, pods et services
###

#names="nginx wordpress mysql" # influxdb grafana mysql phpmyadmin telegraf ftps

for name in $names
do
	kubectl apply -f srcs/$name/$name.yaml
done

#kubectl get svc | grep nginx-service | cut -d " " -f 15,16,17 | tr -d "\n" | tr -d " "

###
# Dashboard
###
minikube dashboard