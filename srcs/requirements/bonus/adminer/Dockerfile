FROM debian:buster


RUN apt-get update;\
    apt-get upgrade;\
    apt-get install adminer -y; \
    a2enconf adminer.conf; \
    sed -i 's/Listen 80/Listen 3000/1' /etc/apache2/ports.conf;\
    sed -i 's/#ServerName www.example.com/ServerName hbel-hou.42.fr/1' /etc/apache2/sites-available/000-default.conf; \
    sed -i 's/<VirtualHost *:80>/<VirtualHost *:3000>/1' /etc/apache2/sites-available/000-default.conf;\
    service apache2 start;

CMD ["/usr/sbin/apachectl", "-DFOREGROUND"]