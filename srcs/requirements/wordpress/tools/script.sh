#!/bin/bash
MYSQL_WP_DBNAME=wordpress
MYSQL_ROOT_PSWD=root123
MYSQL_USERNAME=hbel-hou
MYSQL_PASSWORD=12345

mkdir -p /var/www/html

cd /var/www/html

rm -rf *

curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

chmod +x wp-cli.phar 

# moves the WP-CLI PHAR file to the /usr/local/bin directory, which is in the system's PATH, and renames it to wp. This allows you to run the wp command from any directory
mv wp-cli.phar /usr/local/bin/wp

# The command "wp core download --allow-root" is used in the command-line interface for WordPress.
# It is used to download the latest version of the WordPress core software and install it on the server. 
# The "--allow-root" flag allows the command to be executed as database_userthe root user, which may be necessary for certain server configurations.

wp core download --allow-root

mv wp-config-sample.php wp-config.php 


sed -i "s/database_name_here/$MYSQL_WP_DBNAME/1" wp-config.php
sed -i "s/username_here/$MYSQL_USERNAME/1" wp-config.php
sed -i "s/password_here/$MYSQL_PASSWORD/1" wp-config.php
sed -i "s/localhost/mariadb/1" wp-config.php


wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASSWORD --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

wp user create $WP_USERNAME $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm7.3 -F