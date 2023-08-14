sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php8/php-fpm.d/www.conf

sleep 10
[ ! -f /var/www/wordpress/index.php ] && wp core download --path=/var/www/wordpress --allow-root
[ ! -f /var/www/wordpress/wp-config.php ] && wp config create --dbname=$MYSQL_DB_NAME --dbuser=$MYSQL_USER --dbpass=$MYSQL_PASSWORD --dbhost=mariadb --allow-root --path=/var/www/wordpress --skip-check
wp core install --url=$WP_URL --title=$WP_TITLE --admin_user=$WP_ADMIN_LOGIN --admin_password=$WP_ADMIN_PASSWORD --admin_email=$WP_ADMIN_EMAIL --allow-root --path=/var/www/wordpress --skip-email
wp user create "$WP_USER_LOGIN" "$WP_USER_EMAIL" --role=author --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress --allow-root

php-fpm8 -F
