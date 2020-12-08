FROM alpine

RUN apk update && \
    apk upgrade && \
    apk add curl libc6-compat && \
    curl https://dl.grafana.com/oss/release/grafana-7.2.1.linux-amd64.tar.gz > grafana.tar.gz && \
    tar xvf grafana.tar.gz && \
    mv grafana-7.2.1 grafana

RUN mkdir /grafana/data
COPY grafana.db /grafana/data/grafana.db

RUN curl 'https://dl.influxdata.com/telegraf/releases/telegraf-1.16.0_linux_i386.tar.gz' > telegraf.tar.gz && \
    tar xvf telegraf.tar.gz && \
    mv 'telegraf-1.16.0' telegraf
COPY telegraf.conf /etc/telegraf/telegraf.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x entrypoint.sh

EXPOSE 3000

CMD "/entrypoint.sh"
