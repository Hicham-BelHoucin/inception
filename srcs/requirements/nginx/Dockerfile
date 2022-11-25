FROM debian:stable

RUN  apt update -y && apt install nginx -y && apt install openssl

RUN mkdir /etc/nginx/ssl && chmod 777 /etc/nginx/ssl

RUN openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/CN=demo.mlopshub.com/C=US/L=San Fransisco" \
            -keyout /etc/nginx/ssl/nginx_ssl.key -out /etc/nginx/ssl/nginx_ssl.crt 

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p etc/nginx/html 

COPY tools etc/nginx/html/

CMD ["nginx", "-g", "daemon off;"]
