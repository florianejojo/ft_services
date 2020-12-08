#!/bin/sh

/telegraf/usr/bin/telegraf &

cd /grafana/bin
./grafana-server
