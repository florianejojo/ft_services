FROM alpine

RUN apk update
RUN apk upgrade
RUN apk add vsftpd

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

EXPOSE 21
VOLUME /var/lib/ftp

CMD vsftpd /etc/vsftpd/vsftpd.conf && sh
