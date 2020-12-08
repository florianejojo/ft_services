FROM	alpine

RUN		apk add grafana --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache && \
		apk add telegraf --repository http://dl-cdn.alpinelinux.org/alpine/edge/testing/ --allow-untrusted --no-cache

#### From xav dockerfile
ADD datasource.yaml 			grafana/conf/provisioning/datasources/
ADD dashboard.yaml 			grafana/conf/provisioning/dashboards/
ADD dashboard_overview.json 	/var/lib/grafana/dashboards/
######

COPY	/srcs/telegraf.conf			/etc/telegraf/
COPY	/srcs/grafana.db			/usr/share/grafana/data/
COPY	/srcs/start.sh				/

WORKDIR	/usr/share/grafana

EXPOSE	3000

ENTRYPOINT	sh /start.sh

