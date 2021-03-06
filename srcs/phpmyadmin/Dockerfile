FROM alpine:3.12


RUN apk --no-cache add nginx supervisor curl

RUN apk add php7-fpm php-mbstring php7-openssl php7-json php7-dom php7-zip php7-mysqli \
			php7-curl php7-session php7-opcache php7-gd php7-zlib  php7-common \
			php7-iconv php7-xml php7-imap php7-cgi fcgi \
			php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom

RUN  rm /etc/nginx/conf.d/default.conf

COPY srcs/nginx.conf /etc/nginx/nginx.conf
COPY srcs/www.conf /etc/php7/php-fpm.d/www.conf

COPY srcs/supervisord.conf .

RUN mkdir -p /var/www/html

RUN chown -R nobody.nobody /var/www/html && \
  chown -R nobody.nobody /run && \
  chown -R nobody.nobody /var/lib/nginx && \
  chown -R nobody.nobody /var/log/nginx


WORKDIR /var/www/html/
RUN wget https://files.phpmyadmin.net/phpMyAdmin/4.9.1/phpMyAdmin-4.9.1-english.tar.gz
RUN tar xf phpMyAdmin-4.9.1-english.tar.gz && rm -rf phpMyAdmin-4.9.1-english.tar.gz
RUN mv phpMyAdmin-4.9.1-english phpmyadmin
COPY srcs/config.inc.php phpmyadmin

USER nobody

WORKDIR /var/www/html
COPY --chown=nobody srcs/ /var/www/html/

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000

CMD ["supervisord", "-c", "supervisord.conf"]

