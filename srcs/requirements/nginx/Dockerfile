FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
	&& apt install -y nginx openssl moreutils \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod -R 755 /etc/nginx \
	&& chmod -R 744 /etc/ssl \
	&& chmod -R 755 /var/log/nginx

EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]
