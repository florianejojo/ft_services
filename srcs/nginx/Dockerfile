FROM alpine:latest

RUN apk update && apk add nginx && apk add openssl

#remplacer fichier config nginx
ADD /nginx.conf		/etc/nginx/nginx.conf

#page à afficher, indiquer le chemin dans nginx.conf
#RUN mkdir my_website
ADD /index.html		var/www/

#pour éviter d'utiliser openrc qui fait tourner nginx en background
RUN mkdir -p run/nginx

# openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/C=FR/ST=75017/L=Paris/O=42/CN=my_ssl_certif'

#RUN mkdir /etc/nginx/ssl \

# CONGIF SSH
#ADD /srcs/sshd_config 		/etc/ssh/

#RUN echo "daemon off;" >> /etc/nginx/nginx.conf
EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]
#CMD ["sh", "/setup.sh"]