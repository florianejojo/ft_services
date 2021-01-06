FROM alpine

RUN apk update && apk add vsftpd curl openssl supervisor

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj '/C=FR/ST=75017/L=Paris/O=42/CN=my_ssl_certif'

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf
COPY vsftpd.conf .
COPY supervisord.conf .
COPY check_liveness.sh .

RUN chmod 777 check_liveness.sh

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf

COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21

# CMD vsftpd /etc/vsftpd/vsftpd.conf && sh
CMD ["supervisord", "-c", "supervisord.conf"]
