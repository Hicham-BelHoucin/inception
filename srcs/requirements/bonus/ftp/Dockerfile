FROM debian:buster

RUN apt-get update -y;\
    apt-get install vsftpd -y;

COPY tools/ .

CMD ./ftp.sh