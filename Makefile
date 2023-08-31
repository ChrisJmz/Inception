HOME	=	/home/cjimenez
DOCKER_COMPOSE	=	sudo docker-compose

all: folders
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml up -d

folders:
	mkdir -p $(HOME)/data/db_volume
	mkdir -p $(HOME)/data/nginx_volume

build: folders
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml build

log: folders
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml up

stop:
	$(DOCKER_COMPOSE) -f srcs/docker-compose.yml down

clean: stop
	sudo docker system prune -f -a

fclean: clean
	sudo rm -rf ${HOME}/data

re : fclean all
