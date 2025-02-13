

up:
	docker-compose -f ./srcs/docker-compose.yml up -d --build 

down:
	docker-compose -f ./srcs/docker-compose.yml down -v


CERTS_DIR = ./secrets/ssl
CERT_FILE = $(CERTS_DIR)/nginx.crt
CERT_KEY = $(CERTS_DIR)/nginx.key


generate-certs: $(CERT_FILE)
$(CERT_FILE): $(CERT_KEY)
$(CERT_KEY):
	mkdir -p $(CERTS_DIR)
	openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
		-keyout $(CERT_KEY) -out $(CERT_FILE) \
		-subj "/C=AM/L=Yerevan/O=42/OU=student/CN=aggrigor.42.fr"
	
