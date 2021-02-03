FROM alpine:3.12

RUN apk add nginx supervisor curl 

RUN	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli \
            php7-zlib php7-curl php7-mbstring php7-json php7-session  \
            php7-fpm 

RUN		wget http://wordpress.org/latest.tar.gz && tar -xzvf latest.tar.gz && rm latest.tar.gz
RUN		mkdir -p /var/www && mv /wordpress /var/www/

COPY nginx.conf /etc/nginx/conf.d

COPY supervisord.conf .

RUN mkdir -p /run/nginx && \
    rm /etc/nginx/conf.d/default.conf

COPY wp-config.php /var/www/wordpress/wp-config.php

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5050

CMD ["supervisord", "-c", "supervisord.conf"]

