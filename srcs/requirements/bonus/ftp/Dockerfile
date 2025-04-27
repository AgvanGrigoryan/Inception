FROM debian:bullseye

RUN 	apt-get update && \
	apt-get install -y vsftpd && \
	apt-get install -y passwd && \
	rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/vsftpd/empty

#COPY conf/vsftpd.conf /etc/vsftpd.conf
COPY conf/conf.conf /etc/vsftpd.conf
COPY tools/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
