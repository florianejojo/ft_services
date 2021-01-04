#!/bin/sh

/telegraf/usr/bin/telegraf &

nginx -t || exit 1
nginx -g 'daemon off;'



# telegraf && nginx -g 'daemon off;'

# # /telegraf/usr/bin/telegraf

