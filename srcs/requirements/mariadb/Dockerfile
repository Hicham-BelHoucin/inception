# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbel-hou <hbel-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:21:04 by hbel-hou          #+#    #+#              #
#    Updated: 2023/01/18 15:29:43 by hbel-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

COPY ./tools/script.sh .

RUN apt update -y;\
    apt upgrade -y;\
    apt install mariadb-server -y; \ 
    sed -i "s/#port/port/" /etc/mysql/mariadb.conf.d/50-server.cnf; \
    sed -i "s/127.0.0.1/0.0.0.0/" /etc/mysql/mariadb.conf.d/50-server.cnf;

CMD ["bash", "script.sh"]