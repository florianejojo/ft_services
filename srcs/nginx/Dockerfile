FROM alpine:latest

RUN apk update && apk add nginx && apk add curl && apk add openssl libressl

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
RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf && rm telegraf.tar.gz 
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY setup.sh .
RUN chmod +x setup.sh


EXPOSE 80
EXPOSE 443

CMD ./setup.sh

# CMD ["nginx", "-g", "daemon off;"]
# ENTRYPOINT nginx -g "daemon off;" ; /telegraf/usr/bin/telegraf



