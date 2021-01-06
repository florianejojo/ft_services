FROM alpine:latest

RUN apk update && apk add nginx curl openssl libressl supervisor

#remplacer fichier config nginx
COPY nginx.conf		/etc/nginx

#page à afficher
COPY index.html		var/www/

#pour éviter d'utiliser openrc qui fait tourner nginx en background
RUN mkdir -p run/nginx

# openssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/C=FR/ST=75017/L=Paris/O=42/CN=my_ssl_certif'

#RUN mkdir /etc/nginx/ssl \
RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf && rm telegraf.tar.gz

COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY supervisord.conf .

EXPOSE 80
EXPOSE 443

CMD ["supervisord", "-c", "supervisord.conf"]