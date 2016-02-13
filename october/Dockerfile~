FROM tutum/lamp:latest
RUN apt-get update && apt-get dist-upgrade -y && apt-get install -y \
        unzip \
        curl \
    && curl -SL "http://octobercms.com/download" -o install-master.zip \
    && unzip install-master.zip \
    && mv install-master/* /app \
    && rm -r install-master* \
    && apt-get autoremove -y \
    && apt-get autoclean -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
    && chown -R www-data:www-data /app \
    && a2enmod rewrite
