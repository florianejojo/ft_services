# Livenessprobe check if vsftpd is running
curl --ftp-ssl --insecure --user admin:admin ftp://172.17.0.2:21
# curl --ftp-ssl --insecure --user admin:admin ftp://192.168.99.132:21