FROM alpine:3.12

RUN apk add php7-fpm php-mbstring php7-openssl php7-json php7-dom php7-zip php7-mysqli \
			php7-curl php7-session php7-opcache php7-gd php7-zlib  php7-common \
			php7-iconv php7-xml php7-imap php7-cgi fcgi \
			php7-pdo php7-pdo_mysql php7-soap php7-xmlrpc php7-posix php7-mcrypt php7-gettext php7-ldap php7-ctype php7-dom nginx curl

VOLUME /var/www/html

RUN curl 'https://files.phpmyadmin.net/phpMyAdmin/5.0.2/phpMyAdmin-5.0.2-all-languages.zip' > phpmyadmin.zip \
    && unzip phpmyadmin.zip \
    && mv 'phpMyAdmin-5.0.2-all-languages' /var/www/html
COPY etc/phpmyadmin/config.inc.php /var/www/html/

# Copy configuration config.inc.php et php-fpm.conf et nginx.conf
COPY etc/* /etc
COPY www.conf /etc/php7/php-fpm.d/www.conf
RUN  rm /etc/nginx/conf.d/default.conf
COPY php.ini /usr/local/etc/php/conf.d/php-phpmyadmin.ini

# Copy main script
COPY run.sh /run.sh
RUN chmod 777 /run.sh

# We expose phpMyAdmin on port 9000
EXPOSE 5000

CMD [ "/run.sh" ]