FROM alpine:3.16

RUN apk update && apk upgrade

RUN apk add php8 php8-fpm php8-opcache php8-gd php8-mysqli php8-zlib php8-curl php8-mbstring php8-json php8-session php8-phar curl

WORKDIR /var/www

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && chmod +x wp-cli.phar && mv wp-cli.phar /usr/local/bin/wp

RUN mkdir -p /run/php

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
