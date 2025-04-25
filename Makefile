WORDPRESS_VOLUME_DIR=/home/aggrigor/data/wordpress
DB_VOLUME_DIR=/home/aggrigor/data/mysql

CERTS_DIR = ./secrets/ssl
CERT_FILE = $(CERTS_DIR)/nginx.crt
CERT_KEY = $(CERTS_DIR)/nginx.key

all:  up

setup:
	mkdir -p $(WORDPRESS_VOLUME_DIR)
	mkdir -p $(DB_VOLUME_DIR)

up: setup generate-certs
	docker-compose -f ./srcs/docker-compose.yml up -d --build 

down:
	docker-compose -f ./srcs/docker-compose.yml down 

clean: down
	docker system prune -af

fclean:
	$(COMPOSE) down --volumes --rmi all --remove-orphans > /dev/null 2>&1 || true
	docker system prune -af > /dev/null 2>&1
	docker network prune --force > /dev/null 2>&1
	sudo $(RM) $(DATA_DIR)

re: fclean all

restart: down up

generate-certs: $(CERT_FILE)
$(CERT_FILE): $(CERT_KEY)
$(CERT_KEY):
	mkdir -p $(CERTS_DIR)
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout $(CERT_KEY) -out $(CERT_FILE) \
		-subj "/C=AM/L=Yerevan/O=42/OU=student/CN=aggrigor.42.fr"

.PHONY: all up down clean fclean re restart
	
