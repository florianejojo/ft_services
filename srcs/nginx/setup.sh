#!/bin/sh

echo 'root:password' | chpasswd
echo 'PermitRootLogin yes' >> /etc/ssh/sshd_confi

/telegraf/usr/bin/telegraf
/etc/init.d/sshd start

nginx -g 'daemon off;'
