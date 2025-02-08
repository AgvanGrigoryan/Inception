

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build 

down:
	docker-compose -f ./srcs/docker-compose.yml down -v


CERTS_DIR = ./secrets/ssl

generate-certs: 
	mkdir -p $(CERTS_DIR)
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout $(CERTS_DIR)/nginx.key -out $(CERTS_DIR)/nginx.crt \
		-subj "/C=AM/L=Yerevan/O=42/OU=student/CN=aggrigor.42.fr"
	
