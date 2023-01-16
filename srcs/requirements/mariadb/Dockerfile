FROM debian:buster

COPY ./tools/script.sh .

RUN apt update -y;\
    apt upgrade -y;\
    apt install mariadb-server -y; \ 
    sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf; \
    sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;

CMD ["./script.sh"]