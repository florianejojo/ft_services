#!/bin/sh

/telegraf/usr/bin/telegraf &
influxd run -config /etc/influxdb.conf
