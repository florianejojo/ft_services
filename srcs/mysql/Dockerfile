
FROM alpine

RUN apk update \
&& apk add mariadb mariadb-client curl supervisor && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

COPY init_docker.sh .
COPY init_mysql.sh .
COPY wordpress.sql .
COPY supervisord.conf .
COPY telegraf.conf /etc/telegraf

RUN chmod 777 init_docker.sh
RUN chmod 777 init_mysql.sh

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf

EXPOSE 3306

CMD ["supervisord", "-c", "supervisord.conf"]

