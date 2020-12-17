FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add vsftpd curl

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

EXPOSE 21
VOLUME /var/lib/ftp

CMD vsftpd /etc/vsftpd/vsftpd.conf && sh
