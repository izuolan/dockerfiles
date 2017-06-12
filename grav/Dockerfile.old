FROM alpine
MAINTAINER Zuo Lan <i@zuolan.me>
ENV TERM="xterm" \
    GRAV_VERSION="1.1.15"

RUN apk update && \
    apk add --no-cache \
        bash less vim git tzdata curl yaml zip \
        nginx ca-certificates \
        php7-fpm php7-json php7-zlib php7-xml php7-pdo php7-phar php7-openssl \
        php7-gd php7-iconv php7-mcrypt php7-session php7-zip \
        php7-curl php7-opcache php7-ctype php7-apcu \
        php7-intl php7-bcmath php7-dom php7-mbstring php7-xmlreader && \
    apk add -u musl && \
    rm -rf /var/cache/apk/*

RUN sed -i 's/;cgi.fix_pathinfo=1/cgi.fix_pathinfo=0/g' /etc/php7/php.ini && \
    sed -i 's/expose_php = On/expose_php = Off/g' /etc/php7/php.ini && \
    sed -i "s/nginx:x:100:101:nginx:\/var\/lib\/nginx:\/sbin\/nologin/nginx:x:100:101:nginx:\/usr:\/bin\/bash/g" /etc/passwd && \
    sed -i "s/nginx:x:100:101:nginx:\/var\/lib\/nginx:\/sbin\/nologin/nginx:x:100:101:nginx:\/usr:\/bin\/bash/g" /etc/passwd- && \
    ln -s /usr/bin/php7 /usr/bin/php && \
    ln -s /sbin/php-fpm7 /sbin/php-fpm

COPY files/nginx.conf /etc/nginx/
COPY files/php-fpm.conf /etc/php7/
COPY files/run.sh /
RUN chmod +x /run.sh


EXPOSE 80
VOLUME ["/usr"]
CMD ["/run.sh"]
