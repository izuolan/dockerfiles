FROM ubuntu:trusty
MAINTAINER ZuoLan <i@zuolan.me>

ENV TYPECHO_VERSION v1.1-15.5.12-beta

# Install modules
RUN apt-get update && \
    apt-get install -y \
    unzip \
    nginx \
    ca-certificates \
    libfreetype6-dev \
    libjpeg62-turbo-dev \
    libmcrypt-dev \
    libpng12-dev \
    libcurl4-openssl-dev \
    php5 php5-fpm php5-cli php5-json php5-mysql php5-curl php5-sqlite
RUN docker-php-ext-install iconv mcrypt mbstring pdo_mysql mysqli curl gd && \
    docker-php-ext-configure gd --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/

RUN mkdir /www
WORKDIR /www
VOLUME /www

RUN cd /tmp && \
    curl -o typecho.tar.gz -L https://github.com/typecho/typecho/releases/download/${TYPECHO_VERSION}/typecho.tar.gz && \
    tar -xvf typecho.tar.gz && \
    mv -f /tmp/build/* /www && \
    curl -o Themia-for-TE-master.zip -L https://github.com/jrotty/Themia-for-TE/archive/master.zip && \
    unzip Themia-for-TE-master.zip && mv ./Themia-for-TE-master /www/usr/themes/themia

ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get purge --auto-remove -y unzip && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["sh", "-c", "chown -R www-data: /www && service php5-fpm start && nginx"]
