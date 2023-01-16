#!/bin/bash

# MYSQL_WP_DBNAME=wordpress
# MYSQL_ROOT_PSWD=root123
# MYSQL_USERNAME=hbel-hou
# MYSQL_PASSWORD=12345

service mysql start

echo "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DBNAME ;" | mysql
echo "CREATE USER IF NOT EXISTS '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD' ;" | mysql
echo "GRANT ALL PRIVILEGES ON $MYSQL_WP_DBNAME.* TO '$MYSQL_USERNAME'@'%' ;" | mysql
echo "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PSWD' ;" | mysql

mysqladmin shutdown -uroot -p$MYSQL_ROOT_PSWD


mysqld_safe