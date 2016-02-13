FROM tutum/lamp:latest
RUN rm -fr /app
ADD app/ /app

RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y libjpeg62-turbo-dev libmcrypt-dev libpng12-dev
RUN docker-php-ext-install mcrypt
RUN docker-php-ext-install gd
RUN docker-php-ext-install mbstring

RUN apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chmod -R 777 /app \
    && a2enmod rewrite

EXPOSE 80 3306
CMD ["/run.sh"]
