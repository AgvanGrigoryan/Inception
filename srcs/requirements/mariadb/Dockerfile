FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
	&& apt install -y nginx mariadb-server \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/
COPY tools/entrypoint.sh /entrypoint.sh

RUN chmod +x /entrypoint.sh

EXPOSE 3306

CMD ["/bin/bash", "/entrypoint.sh"] # replace CMD to ENTRYPOINT if it alowed by subject
