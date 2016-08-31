FROM alpine:3.4
MAINTAINER Zuo Lan <i@zuolan.me>

RUN apk add --update --no-cache \
    ca-certificates \
    openssl \
    php5-fpm \
    sqlite \
    curl \
    git \
    php5-pdo \
    php5-pdo_sqlite \
    php5-sqlite3 \
    php5-ctype \
    php5-curl \
    php5-dom \
    php5-gd \
    php5-iconv \
    php5-json \
    php5-xml \
    php5-mcrypt \
    php5-openssl \
    php5-posix \
    php5-sockets \
    php5-zip \
    && echo "clear_env = no" >> /etc/php5/php-fpm.conf \
    && curl --silent --show-error --fail --location \
       --header "Accept: application/tar+gzip, application/x-gzip, application/octet-stream" -o - \
       "https://caddyserver.com/download/build?os=linux&arch=amd64" \
       | tar --no-same-owner -C /usr/bin/ -xz caddy \
    && chmod 0755 /usr/bin/caddy \
    && /usr/bin/caddy -version

WORKDIR /srv
EXPOSE 80 443 2015
ADD Caddyfile /etc/caddy/Caddyfile
VOLUME ["/srv/","/etc/caddy/"]

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["--conf", "/etc/caddy/Caddyfile"]
