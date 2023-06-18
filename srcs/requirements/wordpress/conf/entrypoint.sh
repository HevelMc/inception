sed -i 's/^listen = .*/listen = 0.0.0.0:9000/' /etc/php8/php-fpm.d/www.conf
mv /var/www/wp-config.php /var/www/wordpress/wp-config.php
sed -i "s/MYSQL_PASSWORD/$MYSQL_PASSWORD/g" /var/www/wordpress/wp-config.php

php-fpm8 -F