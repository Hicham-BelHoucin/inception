# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: hbel-hou <hbel-hou@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/01/18 13:20:45 by hbel-hou          #+#    #+#              #
#    Updated: 2023/01/18 16:52:08 by hbel-hou         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME=inception
WEBSITE=$(HOME)/data/wordpress
DB=$(HOME)/data/mariadb 
COMPOSEFILE=./srcs/docker-compose.yml
DOCKERCMD=sudo docker compose

all: $(NAME)

$(NAME): volumes
	@$(DOCKERCMD) -f $(COMPOSEFILE) up  --build -d

volumes:
	@mkdir -p $(WEBSITE)
	@mkdir -p $(DB)

ps:
	@sudo docker ps

up:
	@$(DOCKERCMD) -f $(COMPOSEFILE) up -d

down:
	@$(DOCKERCMD) -f $(COMPOSEFILE) down

logs:
	@$(DOCKERCMD) -f $(COMPOSEFILE) logs -f

clean: 
	@sudo rm -rf $(WEBSITE)
	@sudo rm -rf $(DB)

re: down clean all