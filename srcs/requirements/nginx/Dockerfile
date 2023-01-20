# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbel-hou <hbel-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:21:14 by hbel-hou          #+#    #+#              #
#    Updated: 2023/01/18 13:21:16 by hbel-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


FROM debian:buster


RUN  apt update -y; \
    apt install nginx openssl -y; \
    mkdir -p /etc/nginx/ssl; \
    openssl req -x509 \
            -sha256 -days 356 \
            -nodes \
            -newkey rsa:2048 \
            -subj "/C=MA/ST=khouribga/L=khouribga/O=1337/OU=1337/CN=nginx" \
            -keyout /etc/nginx/ssl/nginx_ssl_key.pem \ 
            -out /etc/nginx/ssl/nginx_ssl_cert.pem; 

COPY ./conf/nginx.conf /etc/nginx/sites-available/default

CMD ["nginx", "-g", "daemon off;"]
# CMD ["bash"]
