# Используем базовый образ Debian Bullseye
FROM debian:bullseye

# Установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y wget apache2 php php-mysql libapache2-mod-php && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Скачиваем Adminer
RUN wget https://www.adminer.org/latest.php -O /var/www/html/adminer.php

# Настройка Apache
RUN echo "ServerName localhost" >> /etc/apache2/apache2.conf
RUN a2enmod rewrite
RUN chown -R www-data:www-data /var/www/html
RUN chmod -R 755 /var/www/html
RUN service apache2 restart
 
# Открываем порт 80 для Apache
EXPOSE 80

# Запускаем Apache
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
