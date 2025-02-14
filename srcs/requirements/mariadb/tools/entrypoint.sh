set -e

# set env variables for db
if [ -f $MYSQL_ROOT_PASSWORD_FILE ]; then
	export MYSQL_ROOT_PASSWORD=$(cat $MYSQL_ROOT_PASSWORD_FILE)
fi

if [ -f $MYSQL_PASSWORD_FILE ]; then
	export MYSQL_PASSWORD=$(cat $MYSQL_PASSWORD_FILE)
fi

# initialize the database
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql --basedir=/usr
fi

if [ -f "/docker-entrypoint-initdb.d/init.sql" ]; then
	envsubst < /docker-entrypoint-initdb.d/init.sql > /tmp/init.sql
	sed "s|\b$MYSQL_USER\b|'$MYSQL_USER'|g" | \
	sed "s|\b$MYSQL_PASSWORD\b|'$MYSQL_PASSWORD'|g" | \
	sed "s|\b$MYSQL_DATABASE\b|'$MYSQL_DATABASE'|g" > /tmp/init.sql
	#exec env > /var/lib/mysql/con_env
	exec cat /tmp/init.sql > /var/lib/mysql/init.sql
	mysql < /tmp/init.sql
fi
exec sleep infinity
# exec mysqld --user=mysql
