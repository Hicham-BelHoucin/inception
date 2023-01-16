FROM debian:buster

RUN apt-get update;\
    apt-get upgrade;\
    apt-get install php-fpm php-mysql -y; \
    apt-get install curl -y;

COPY tools/script.sh .

CMD ["bash", "script.sh"]


