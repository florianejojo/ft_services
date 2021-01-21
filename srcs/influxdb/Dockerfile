FROM alpine:3.12

RUN apk update && \
    apk upgrade && \
	apk add influxdb curl

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 8086

CMD "/entrypoint.sh"
