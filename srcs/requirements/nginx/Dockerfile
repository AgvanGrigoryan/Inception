FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
	&& apt install -y nginx openssl moreutils \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/sites-available/default

RUN chmod -R 755 /etc/nginx \
	&& chmod -R 744 /etc/ssl \
	&& chmod -R 755 /var/log/nginx


EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]

