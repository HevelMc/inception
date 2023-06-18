FROM alpine:3.16

RUN apk update && apk upgrade

RUN apk add php8 php8-fpm php8-opcache php8-gd php8-mysqli php8-zlib php8-curl php8-mbstring php8-json php8-session curl

WORKDIR /var/www

RUN curl -O https://wordpress.org/latest.tar.gz && tar -xvf latest.tar.gz && rm latest.tar.gz

RUN mkdir -p /run/php

ADD ./conf/wp-config.php wp-config.php

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
