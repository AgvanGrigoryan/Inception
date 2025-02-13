FROM debian:bullseye

RUN apt update -y && apt upgrade -y \
	&& apt install -y nginx mariadb-server \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/*

COPY conf/my.cnf /etc/mysql/my.cnf
COPY tools/init.sql /docker-entrypoint-initdb.d/

EXPOSE 3306

CMD ["sleep", "infinity"]
#CMD ["mysql"]
