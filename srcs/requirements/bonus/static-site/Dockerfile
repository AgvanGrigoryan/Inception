FROM debian:bullseye

RUN apt update && apt install -y nginx && rm -rf /var/lib/apt/lists/*

COPY static/index.html /var/www/html/index.html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
