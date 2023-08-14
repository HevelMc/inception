/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &

while ! mysqladmin ping -hlocalhost --silent; do
  sleep 1
done

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e \
"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
 CREATE DATABASE IF NOT EXISTS $MYSQL_DB_NAME;\
 CREATE USER IF NOT EXISTS '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
 GRANT ALL PRIVILEGES ON $MYSQL_DB_NAME.* TO '$MYSQL_USER'@'%';\
 FLUSH PRIVILEGES;"
mysqladmin -uroot -p"$MYSQL_ROOT_PASSWORD" shutdown

exec /usr/bin/mysqld_safe --datadir='/var/lib/mysql'