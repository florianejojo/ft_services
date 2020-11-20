#! /bin/bash

# Wait that mysql was up
until mysql
do
	echo "NO_UP"
done

# Init DB

echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "CREATE USER 'wp_admin'@'%' IDENTIFIED BY 'admin';" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'wp_admin'@'%' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "DROP DATABASE test" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password
mysql wordpress -u root --password=  < wp.sql

# CREATE DATABASE IF NOT EXISTS $WP_DB_NAME;
# CREATE USER 'wp-user'@'%' IDENTIFIED BY 'wp-pass';
# GRANT ALL ON 'wp-database'.* TO 'wp-user'@'%' IDENTIFIED BY 'wp-pass' WITH GRANT OPTION;
# FLUSH PRIVILEGES;