FROM debian:buster

RUN apt-get update;\
    apt-get -y install wget;\
    wget https://github.com/google/cadvisor/releases/download/v0.37.0/cadvisor;\
    chmod +x cadvisor;

CMD ["./cadvisor"]