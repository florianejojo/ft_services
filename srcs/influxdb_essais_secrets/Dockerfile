FROM 	alpine

RUN		apk update && apk add openrc --no-cache && \
		apk add influxdb && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
		openrc && touch /run/openrc/softlevel && \
		rc-update add telegraf


COPY	/srcs/telegraf.conf			/etc/
COPY	/srcs/start.sh				/
RUN chmod 777 start.sh	 



EXPOSE	8086

CMD sh start.sh
