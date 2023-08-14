build:
	docker compose -f srcs/docker-compose.yml up -d --build

stop:
	docker compose -f srcs/docker-compose.yml down

fclean:
	docker compose -f srcs/docker-compose.yml down --rmi all --volumes

setup:
	cp srcs/.env.example srcs/.env
	@read -p "MYSQL_ROOT_PASSWORD: " MYSQL_ROOT_PASSWORD && sed -i '' "s/MYSQL_ROOT_PASSWORD=.*/MYSQL_ROOT_PASSWORD=$${MYSQL_ROOT_PASSWORD:-changeme}/g" srcs/.env
	@read -p "MYSQL_PASSWORD: " MYSQL_PASSWORD && sed -i '' "s/MYSQL_PASSWORD=.*/MYSQL_PASSWORD=$${MYSQL_PASSWORD:-changeme}/g" srcs/.env
	@read -p "WP_ADMIN_PASSWORD: " WP_ADMIN_PASSWORD && sed -i '' "s/WP_ADMIN_PASSWORD=.*/WP_ADMIN_PASSWORD=$${WP_ADMIN_PASSWORD:-changeme}/g" srcs/.env
	@read -p "WP_USER_PASSWORD: " WP_USER_PASSWORD && sed -i '' "s/WP_USER_PASSWORD=.*/WP_USER_PASSWORD=$${WP_USER_PASSWORD:-changeme}/g" srcs/.env