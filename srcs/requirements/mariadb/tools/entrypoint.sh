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
mkdir -p /run/mysqld
chown -R mysql:mysql /run/mysqld
chown -R mysql:mysql /var/lib/mysql
chmod -R 700 /var/lib/mysql

exec mysqld --user=mysql --socket=/run/mysqld/mysqld.sock # --skip-networking 
sleep 5

until mysqladmin ping --silent; do
	echo "Waiting for MariaDB launch..."
	sleep 2
done

if [ -f "/docker-entrypoint-initdb.d/init.sql" ]; then
	envsubst < /docker-entrypoint-initdb.d/init.sql > /tmp/init.sql
	if [ -s "/tmp/init.sql" ]; then
		mysql < /tmp/init.sql
	else
		echo "The init.sql script is skipped"
	fi
fi
