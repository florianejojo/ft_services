#!/bin/sh
influx -execute "CREATE USER telegraf_user WITH PASSWORD 'telegraf_password'"
influx -execute "GRANT ALL ON influxdb TO telegraf_user"
# politique de rétention pour déterminer la durée de conservation des données (ici 52 semaines)
influx -execute "CREATE RETENTION POLICY "a_year" ON "influxdb" DURATION 52w REPLICATION 1 DEFAULT"
influx -execute "SHOW MEASUREMENTS ON influxdb"
