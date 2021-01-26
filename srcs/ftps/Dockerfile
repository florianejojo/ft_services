FROM alpine:3.12

RUN apk update
RUN apk upgrade
RUN apk add vsftpd openssl curl supervisor

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj '/C=FR/ST=75017/L=Paris/O=42/CN=flolefeb'

RUN adduser admin -D
RUN echo -e "admin\nadmin" | passwd admin

COPY supervisord.conf /etc/supervisord.conf

# COPY check_liveness.sh .
# RUN chmod 777 check_liveness.sh

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21 30020

CMD ["supervisord", "-c", "/etc/supervisord.conf"]