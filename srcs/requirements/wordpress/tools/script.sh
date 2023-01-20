# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    script.sh                                          :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbel-hou <hbel-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:21:32 by hbel-hou          #+#    #+#              #
#    Updated: 2023/01/18 17:09:19 by hbel-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/bash


if [ ! -e '/var/www/html/wp-config.php' ]; then

    mkdir -p '/var/www/html/'
    wp core download --allow-root --path='/var/www/html/'
    wp core config --dbname=$MYSQL_WP_DBNAME --dbuser=$MYSQL_USERNAME --dbpass=$MYSQL_PASSWORD --dbhost=$WP_DB_HOST --skip-check --path='/var/www/html/' --allow-root
    wp core install --url=$DOMAIN_NAME/ --title=$WP_TITLE --admin_user=$WP_ADMIN --admin_password=$WP_ADMINPASSWORD --admin_email=$WP_ADMIN_EMAIL --path='/var/www/html/' --allow-root
    wp user create $WP_USERNAME $WP_EMAIL --role=author --user_pass=$WP_PASSWORD --allow-root --path='/var/www/html/'
fi

sed -i 's/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/g' /etc/php/7.3/fpm/pool.d/www.conf

service php7.3-fpm start
service php7.3-fpm stop

/usr/sbin/php-fpm7.3 -F