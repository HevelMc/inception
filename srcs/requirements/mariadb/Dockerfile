FROM alpine:3.16

RUN apk update && \
    apk add mariadb mariadb-client && \
    rm -rf /var/cache/apk/*

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql && \
    chown -R mysql:mysql /var/lib/mysql

RUN sed -i 's/#bind-address/bind-address/g' /etc/my.cnf.d/mariadb-server.cnf \
 && sed -i 's/skip-networking/#skip-networking/g' /etc/my.cnf.d/mariadb-server.cnf

COPY ./conf/entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh

ENTRYPOINT ["sh", "/tmp/entrypoint.sh"]
