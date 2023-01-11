FROM debian:stable

RUN  apt update -y && apt install nginx -y && apt install openssl

RUN mkdir /etc/nginx/ssl && chmod 777 /etc/nginx/ssl

RUN openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx" \
            -keyout /etc/nginx/ssl/nginx_ssl_key.pem \ 
            -out /etc/nginx/ssl/nginx_ssl_cert.pem 

COPY conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/html && chmod 777 /etc/nginx/html

COPY tools etc/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
