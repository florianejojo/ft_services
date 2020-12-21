# FROM alpine

# RUN apk update && \
#     apk upgrade && \
# 	apk add mysql mysql-client curl --no-cache

# COPY entrypoint.sh /entrypoint.sh
# RUN chmod +x /entrypoint.sh
# COPY my.cnf /etc/my.cnf
# COPY my.cnf /etc/mysql/my.cnf
# COPY wordpress.sql /wordpress.sql

# # RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
# #     tar xvf telegraf.tar.gz && \
# #     mv 'telegraf-1.16.0' telegraf
# # COPY telegraf.conf /etc/telegraf/telegraf.conf

# EXPOSE 3306

# CMD ["/entrypoint.sh"]

# FROM Image : alpine
FROM alpine:latest

# VOLUME /var/run/docker.sock:/var/run/docker.sock

# Installation
RUN apk update \
&& apk add mariadb mariadb-client curl && apk add --no-cache --upgrade bash \
&& rm -rf /var/cache/apk/*

#persistent volume
# RUN mkdir -p /mnt/data
# RUN mkdir /dat=  < wa
# RUN chmod 777 /data

# Copy initialisation script
COPY ./init_docker.sh .
COPY ./init_mysql.sh .
COPY wordpress.sql .

# Add permission
RUN chmod 777 init_docker.sh
RUN chmod 777 init_mysql.sh

#telegraf

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 3306

# Start configuration script
ENTRYPOINT [ "./init_docker.sh" ]

