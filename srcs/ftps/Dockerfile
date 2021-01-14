# FROM alpine

# RUN apk update && apk add vsftpd curl openssl supervisor



# # RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd-selfsigned.key -out /etc/ssl/certs/vsftpd-selfsigned.crt -subj '/C=FR/ST=75017/L=Paris/O=42/CN=flolefeb
# RUN mkdir -p /etc/ssl-vsftpd/private
# RUN chmod 700 /etc/ssl-vsftpd/private
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj '/C=FR/ST=75/L=Paris/O=42/CN=vo-nguye' -keyout /etc/ssl-vsftpd/private/vsftpd.key -out /etc/ssl-vsftpd/private/vsftpd.pem



# # COPY vsftpd.conf /etc/vsquitftpd/vsftpd.conf
# COPY vsftpd.conf .
# COPY supervisord.conf .
# # COPY set_user_pass.sh .




# VOLUME /var/lib/ftp
# RUN mkdir /home/ftp
# RUN chmod 777 -R /var/lib/ftp
# RUN chmod 777 -R /home/ftp




# RUN adduser admin -D
# RUN echo -e "admin\nadmin" | passwd admin
# RUN chown admin /var/lib/ftp
# RUN chown admin /home/ftp



# # COPY check_liveness.sh .
# # RUN chmod 777 check_liveness.sh 


# # RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
# #     tar xvf telegraf.tar.gz && \
# #     mv 'telegraf-1.16.0' telegraf

# # COPY telegraf.conf /etc/telegraf/telegraf.conf

# EXPOSE 21

# CMD ["supervisord", "-c", "supervisord.conf"]




FROM alpine

EXPOSE 21 30020

RUN apk update
RUN apk upgrade
RUN apk add vsftpd openssl curl supervisor

COPY vsftpd.conf /etc/vsftpd/vsftpd.conf

 RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/vsftpd.key -out /etc/ssl/certs/vsftpd.crt -subj '/C=FR/ST=75017/L=Paris/O=42/CN=flolefeb'

# RUN mkdir -p /etc/ssl-vsftpd/private
# RUN chmod 700 /etc/ssl-vsftpd/private
# RUN openssl req -x509 -nodes -days 365 -newkey rsa:1024 -subj '/C=FR/ST=75/L=Paris/O=42/CN=vo-nguye' -keyout /etc/ssl-vsftpd/private/vsftpd.key -out /etc/ssl-vsftpd/private/vsftpd.pem
# VOLUME /var/lib/ftp
# RUN mkdir /home/ftp
# RUN mkdir /home/toto
# ADD ./srcs/ft_services.txt /var/lib/ftp/ft_services.txt
# ADD ./srcs/ft_services.txt /home/toto/
# RUN chmod 777 -R /var/lib/ftp
# RUN chmod 777 -R /home/ftp

RUN adduser admin -D
RUN echo -e "admin\nadmin" | passwd admin
# RUN chown admin /var/lib/ftp
# RUN chown admin /home/ftp



# COPY ./srcs/telegraf.tar.gz  telegraf.tar.gz
# RUN  tar xvf telegraf.tar.gz && \
#      mv 'telegraf-1.16.0' telegraf
# COPY telegraf.conf /etc/telegraf/telegraf.conf
ADD supervisor.conf /etc/supervisor.conf

CMD ["supervisord", "-c", "/etc/supervisor.conf"]