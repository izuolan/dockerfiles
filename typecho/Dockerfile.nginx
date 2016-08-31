FROM nginx:alpine
MAINTAINER Zuo Lan <i@zuolan.me>

RUN apk add --update --no-cache \
    ca-certificates \
    openssl \
    php5-fpm \
    sqlite \
    supervisor \
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
    && echo "clear_env = no" >> /etc/php5/php-fpm.conf

EXPOSE 80 443
WORKDIR /usr/share/nginx/html
COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY supervisord.conf /etc/supervisord.conf
VOLUME ["/usr/share/nginx/html","/etc/nginx/conf.d/"]
CMD ["/usr/bin/supervisord", "-n", "-c",  "/etc/supervisord.conf"]
# CMD ["nginx", "-g", "daemon off;"]
