FROM alpine:latest

RUN apk update && apk upgrade && apk add bash \
&& apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib php7-curl php7-mbstring php7-json php7-session nginx

RUN mkdir -p /var/www/html

RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.0.1/phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& tar -xvf phpMyAdmin-4.9.0.1-all-languages.tar.gz \
&& mv phpMyAdmin-4.9.0.1-all-languages var/www/html/phpmyadmin \
&& rm -rf /var/cache/apk/*

COPY config.inc.php var/www/html/config.inc.php
COPY nginx.conf /etc/nginx/nginx.conf
COPY www.conf /etc/php7/php-fpm.d/www.conf
COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN chmod 777 /etc/supervisor/conf.d/supervisord.conf 

EXPOSE 5000

CMD /etc/supervisor/conf.d/supervisord.conf