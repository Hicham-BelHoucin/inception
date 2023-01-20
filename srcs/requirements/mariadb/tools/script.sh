#!/bin/bash

if [ ! -d "/var/lib/mysql/$MYSQL_WP_DBNAME" ]; then
    service mysql start
    echo "CREATE DATABASE IF NOT EXISTS $MYSQL_WP_DBNAME ;" | mysql
    echo "GRANT ALL PRIVILEGES ON $MYSQL_WP_DBNAME.* TO '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql
    echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PSWD';" | mysql
    mysqladmin shutdown -uroot -p$MYSQL_ROOT_PSWD    
fi

mysqld_safe