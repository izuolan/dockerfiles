FROM abiosoft/caddy:php
MAINTAINER Zuo Lan <i@zuolan.me>
RUN apk update && \
    apk add --no-cache \
        php7-fpm php7-json php7-zlib php7-xml php7-pdo php7-phar php7-openssl \
        php7-gd php7-iconv php7-mcrypt php7-session php7-zip \
        php7-curl php7-opcache php7-ctype php7-apcu \
        php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader && \
    rm -rf /var/cache/apk/*
