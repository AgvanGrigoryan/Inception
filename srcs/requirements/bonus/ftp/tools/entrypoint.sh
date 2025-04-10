#!/bin/bash
set -e

echo "Script start"

touch /var/log/vsftpd.log
echo "touch /var/log/vsftpd.log"
chmod 666 /var/log/vsftpd.log
echo "chmod 666 /var/log/vsftpd.log"

#find /var/www/wordpress_data -type d -exec chmod 755 {} \;
#find /var/www/wordpress_data -type f -exec chmod 644 {} \;


if [ -n "$FTP_USER" ] && ! id -u "$FTP_USER" > /dev/null 2>&1; then
    echo "Создаём пользователя FTP: $FTP_USER"
    useradd -d /var/www/wordpress_data -M $FTP_USER
    chown -R "$FTP_USER:$FTP_USER" /var/www/wordpress_data
    chmod -R 755 /var/www/wordpress_data
    chown -R "$FTP_USER:$FTP_USER" /var/run/vsftpd/empty
else
	echo "User $FTP_USER has already created"
fi

if [ -f $FTP_PASSWORD_FILE ]; then
	echo "$FTP_USER Password was set '$(cat $FTP_PASSWORD_FILE)'"
    FTP_PASSWORD=$(awk '{$1=$1}1' $FTP_PASSWORD_FILE | tr -d '\n')
    echo "$FTP_USER:$FTP_PASSWORD" | chpasswd
else
	echo "Password don't be set because its not be in docker-secrets"
fi

id "$FTP_USER"


# ftp server start with config 
exec /usr/sbin/vsftpd /etc/vsftpd.conf
