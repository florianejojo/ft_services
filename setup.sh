#! /bin/bash

###
# Droits user42 docker
###

# sudo usermod -aG docker user42; newgrp docker

###
# Choisir Mac ou Vm, Lancer Minikube et installer les addons
###

set_ip="Vm"
if [ set_ip = "Vm" ]
then
	
	#sed -i.bak "s/192.168.99.132/172.17.0.2/g" $(grep -lr "192.168.99.132" srcs/*)
	rm srcs/*/*.bak
	minikube start --vm-driver=docker
	
else
	
	#sed -i.bak "s/172.17.0.2/192.168.99.132/g" $(grep -lr "172.17.0.2" srcs/*)
	rm srcs/*/*.bak
	minikube start --vm-driver=virtualbox

fi
eval $(minikube docker-env)

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

minikube dashboard &