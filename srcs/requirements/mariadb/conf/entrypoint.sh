/usr/bin/mysqld_safe --datadir='/var/lib/mysql' &

while ! mysqladmin ping -hlocalhost --silent; do
  sleep 1
done

mysql -uroot -p"$MYSQL_ROOT_PASSWORD" -e \
"ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';\
 CREATE DATABASE IF NOT EXISTS wordpress;\
 CREATE USER IF NOT EXISTS 'wordpress'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';\
 GRANT ALL PRIVILEGES ON wordpress.* TO 'wordpress'@'%';\
 FLUSH PRIVILEGES;"
mysqladmin -uroot -p"$MYSQL_ROOT_PASSWORD" shutdown

exec /usr/bin/mysqld_safe --datadir='/var/lib/mysql'