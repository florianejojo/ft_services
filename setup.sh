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
# Persistent Volume
## #
# echo "minikube ssh"

# echo "exit"


###
# Create secrets 
## #

# #influxdb
# kubectl create secret generic influxdb-secret \
#   --from-literal=INFLUXDB_DATABASE=local_monitoring \
#   --from-literal=INFLUXDB_USERNAME=root \
#   --from-literal=INFLUXDB_PASSWORD=root1234 \
#   --from-literal=INFLUXDB_HOST=influxdb-service:8086

# #grafana
# kubectl create secret generic grafana-secret \
#   --from-literal=GF_SECURITY_ADMIN_USER=admin \
#   --from-literal=GF_SECURITY_ADMIN_PASSWORD=admin1234

#phpmyadmin
# kubectl create secret generic phpmyadmin-secret \
#   --from-literal=GF_SECURITY_ADMIN_USER=admin \
#   --from-literal=GF_SECURITY_ADMIN_PASSWORD=admin1234

# #telegraf
# kubectl create secret generic telegraf-secret \
#   --from-literal=INFLUXDB_DB=local_monitoring
#   --from-literal=INFLUXDB_URL=http://influxdb-service:8086
#   --from-literal=INFLUXDB_USER=root
#   --from-literal=INFLUXDB_USER_PASSWORD=root1234

###
# Construction des containers
###

names="nginx  influxdb grafana"   #mysql phpmyadmin wordpress  ftps

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

# kubectl apply -f srcs/telegraf/telegraf.yaml

###
# Dashboard
###
minikube dashboard