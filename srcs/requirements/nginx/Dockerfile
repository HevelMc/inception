FROM alpine:3.18

RUN apk update && apk upgrade

RUN apk add nginx openssl

RUN mkdir -p /run/nginx

COPY ./conf/nginx.conf /etc/nginx/http.d/default.conf

RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/nginx/key.pem -out /etc/nginx/cert.pem -subj "/C=FR/ST=France/L=Nice/O=42/OU=42Nice/CN=42.alopez.fr"

CMD ["nginx", "-g", "daemon off;"]
