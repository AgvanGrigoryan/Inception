FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install -y nginx openssl moreutils \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN chmod 755 /etc/nginx
RUN chmod 744 /etc/ssl
RUN chmod -R 755 /var/log/nginx

CMD ["nginx", "-g", "daemon off;"]
