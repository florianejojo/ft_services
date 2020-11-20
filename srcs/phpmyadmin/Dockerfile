FROM alpine

RUN apk update && \
    apk upgrade && \
	apk add php7 php7-fpm php7-opcache php7-gd php7-mysqli php7-zlib \
            php7-curl php7-mbstring php7-json php7-session curl \
            php7-fpm
            # nginx openrc

RUN curl 'https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip' > phpmyadmin.zip \
    && unzip phpmyadmin.zip \
    && mv 'phpMyAdmin-5.0.2-all-languages' /var/www
#peut etre supprimer avant dernière ligne ?
#\
#    rm -rf /var/www && \ 
COPY phpmyadmin.inc.php /var/www
# RUN mkdir /etc/phpmyadmin
# COPY phpmyadmin.inc.php /etc/phpmyadmin

# COPY nginx.conf /etc/nginx/conf.d
# RUN mkdir -p /run/nginx && \
#     rm /etc/nginx/conf.d/default.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

# RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
#     tar xvf telegraf.tar.gz && \
#     mv 'telegraf-1.16.0' telegraf
# COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 5000

CMD ["sh", "entrypoint.sh"]
