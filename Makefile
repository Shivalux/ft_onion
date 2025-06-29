NAME 		= ft_onion
COMPOSE		= docker compose
YML			= ./docker-compose.yml

NORMAL	= \033[0m
GREEN	= \033[1;32m
ORANGE	= \033[1;33m
BLUE	= \033[1;36m
RED		= \033[1;31m

$(NAME):
	$(COMPOSE) -f $(YML) up -d --build
	@echo "ft_onion container is up."

all: ${NAME}

up: $(NAME)

clean:
	$(COMPOSE) -f $(YML) down
	@echo "ft_onion container is down."

down:
	$(COMPOSE) -f $(YML) down
	@echo "ft_onion container is down."

fclean:
	$(COMPOSE) -f $(YML) down
	@docker image rm $(NAME)
	@echo "ft_onion container is down."

list:
	@echo "-------------:: list :: all containers ::-------------"
	@docker ps -a
	@echo
	@echo "-------------:: list :: all images ::-------------"
	@docker images
	@echo
	@echo "-------------:: list :: all networks ::-------------"
	@docker network list
	@echo
	@echo "-------------:: list :: all volumes ::-------------"
	@docker volume list

re: fclean all

.PHONEY: all re clean fclean up down list