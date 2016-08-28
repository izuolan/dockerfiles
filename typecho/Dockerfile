FROM php:7.0-apache
MAINTAINER ZuoLan <i@zuolan.me>

# Install modules
ENV base="ca-certificates libfreetype6-dev libjpeg62-turbo-dev libmcrypt-dev libpng12-dev libcurl4-openssl-dev sqlite3"
ENV build="unzip"
RUN apt-get update && \
    apt-get install -y ${base} ${build}

RUN docker-php-ext-install iconv mcrypt mbstring \
    && docker-php-ext-install pdo_mysql mysqli curl \
    && docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install gd

RUN cd /tmp && \
    curl -o typecho-master.zip -L https://github.com/typecho/typecho/archive/master.zip && \
    unzip typecho-master.zip && \
    mv -f /tmp/typecho-master/* /var/www/html/
# curl -o Themia-for-TE-master.zip -L https://github.com/jrotty/Themia-for-TE/archive/master.zip && \
# unzip Themia-for-TE-master.zip && mv ./Themia-for-TE-master /www/usr/themes/themia

WORKDIR /var/www/html/
VOLUME /var/www/html/
ADD entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh
# ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get purge --auto-remove -y ${build} && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENTRYPOINT ["/entrypoint.sh"]
# CMD ["sh", "-c", "chown -R www-data: /www && service php5-fpm start && nginx"]
