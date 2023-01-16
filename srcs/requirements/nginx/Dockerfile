FROM debian:buster

COPY ./conf/ ./tools/ /tmp/

RUN  apt update -y; \
    apt install nginx openssl -y; \
    mkdir -p /etc/nginx/ssl; \
    openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx" \
            -keyout /etc/nginx/ssl/nginx_ssl_key.pem \ 
            -out /etc/nginx/ssl/nginx_ssl_cert.pem; \
    cp /tmp/nginx.conf /etc/nginx/conf.d/default; \ 
    cp /tmp/index.html /var/www/html;

CMD ["nginx", "-g", "daemon off;"]
