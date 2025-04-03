set -e

if [ -f $WORDPRESS_DB_PASSWORD_FILE ]; then
	export WORDPRESS_DB_PASSWORD=$(cat $WORDPRESS_DB_PASSWORD_FILE)
	echo "WORDPRESS_DB_PASSWORD=$WORDPRESS_DB_PASSWORD" >> /etc/environment
fi

if [ ! -f /var/www/wordpress/wp-config.php ]; then
	cp /var/www/wordpress/wp-config-sample.php /var/www/wordpress/wp-config.php
	chown www-data:www-data /var/www/wordpress/wp-config.php
fi

if [ -f "/etc/php/$PHP_VERSION/fpm/pool.d/www.conf.template" ]; then
	envsubst < /etc/php/$PHP_VERSION/fpm/pool.d/www.conf.template > /etc/php/$PHP_VERSION/fpm/pool.d/www.conf
	rm -rf /etc/php/$PHP_VERSION/fpm/pool.d/www.conf.template
fi

if ! su www-data -s /bin/bash -c "wp core is-installed --path=/var/www/wordpress"; then
	su www-data -s /bin/bash -c "wp core install --url=$WP_URL --title='$WP_TITLE' --admin_user=$WP_ADMIN_USERNAME --admin_email=$WP_ADMIN_EMAIL --admin_password=$(cat $WP_ADMIN_PASSWORD_FILE) --path=/var/www/wordpress"
fi

# Создание администратора
#if ! wp user get $WP_ADMIN_USERNAME --path=/var/www/wordpress > /dev/null 2>&1; then
#	echo "Создание администратора..."
#	su www-data -s /bin/bash -c  "wp user create $WP_ADMIN_USERNAME $WP_ADMIN_EMAIL --role=administrator --user_pass=$(cat $WP_ADMIN_PASSWORD_FILE) --path=/var/www/wordpress"
#fi

# Создание пользователя по умолчанию
#if ! wp user get $WP_DEFAULT_USER_USERNAME --path=/var/www/wordpress > /dev/null 2>&1; then
#	echo "Создание пользователя по умолчанию..."
#	su www-data -s /bin/bash -c "wp user create $WP_DEFAULT_USER_USERNAME $WP_DEFAULT_USER_EMAIL --role=author --user_pass=$(cat $WP_DEFAULT_USER_PASSWORD_FILE) --path=/var/www/wordpress"
#fi

exec php-fpm$PHP_VERSION -F
