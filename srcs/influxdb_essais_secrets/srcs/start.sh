#!/bin/sh

#print le file de config


#set manually the users in init-influxdb.sh
# docker run --rm -e INFLUXDB_DB=influxdb \
#       -e INFLUXDB_ADMIN_USER=db_admin \
#       -e INFLUXDB_ADMIN_PASSWORD=admin \
#       -e INFLUXDB_USER=telegraf \
#       -e INFLUXDB_USER_PASSWORD=telegraf \
#       -v $PWD:/var/lib/influxdb \
#       influxdb /init-influxdb.sh

# docker run --rm influxdb influxd config > influxdb.conf

# Start Telegraf and Influxdb.
#exit
/etc/init.d/telegraf start & influxd
# influx -execute "CREATE DATABASE influxdb;"
