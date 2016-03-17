# FROM tutum/lamp
FROM php:apache
MAINTAINER izuolan <i@zuolan.me>

RUN apt-get update && apt-get install -y \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng12-dev \
        unzip \
        curl \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd \
    && docker-php-ext-install mbstring \
    && docker-php-ext-install zip \
    && curl -SL "http://octobercms.com/download" -o install-master.zip \
    && unzip install-master.zip \
    && mv install-master/* /var/www/html \
    && rm -r install-master* \
    && chown -R www-data:www-data /var/www/html/ \
    && a2enmod rewrite
RUN apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
