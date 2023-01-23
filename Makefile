NAME=inception
WEBSITE=/home/hbel-hou/data/wordpress
DB=/home/hbel-hou/data/mariadb 
COMPOSEFILE=./srcs/docker-compose.yml
DOCKERCMD=sudo docker compose

all: $(NAME)

$(NAME): volumes
	@$(DOCKERCMD) -f $(COMPOSEFILE) up  --build -d

volumes:
	@mkdir -p $(WEBSITE)
	@mkdir -p $(DB)

rebuild:
	@$(DOCKERCMD) -f $(COMPOSEFILE) up --build --force-recreate --no-deps -d wordpress

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

fclean: clean
	@sudo docker system prune -af

re: down fclean all