# don't forget to complete the web site
FROM debian:buster

RUN  apt-get update -y; \
    apt-get install nginx -y;\
    mkdir -p /var/www/html/react/;

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

COPY ./build/ /var/www/html/react/

CMD ["nginx", "-g", "daemon off;"]