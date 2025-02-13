set -e

# set env variables for db
if ( -f $MYSQL_ROOT_PASSWORD_FILE ]; then
	export MYSQL_ROOT_PASSWORD=$(cat $MYSQL_ROOT_PASSWORD_FILE)
fi

if ( -f $MYSQL_PASSWORD_FILE ]; then
	export MYSQL_PASSWORD=$(cat $MYSQL_PASSWORD_FILE)
fi

# initialize the database
if [ ! -d "/var/lib/mysql/mysql" ]; then
	mysql_install_db --user=mysql --datadir=/var/lib/mysql --basedir=/usr
fi

if ( -f "/docker-entrypoint-initdb.d/init.sql" ]; then
	mysql < /docker-entrypoint-initdb.d/init.sql
fi

exec mysqld --user=mysql
