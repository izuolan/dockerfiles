FROM ubuntu:trusty
MAINTAINER ZuoLan <i@zuolan.me>

ENV ALLOW_OVERRIDE **False**

# Install base packages
RUN apt-get update && \
    apt-get -yq install \
        curl \
        apache2 \
        sqlite3 \
        libapache2-mod-php5 \
        php5-mysql \
        php5-sqlite
        php5-mcrypt \
        php5-gd \
        php5-curl \
        php-pear \
        php-apc \
        unzip && \
    rm -rf /var/lib/apt/lists/*
RUN /usr/sbin/php5enmod mcrypt && \
    echo "ServerName localhost" >> /etc/apache2/apache2.conf && \
    sed -i "s/variables_order.*/variables_order = \"EGPCS\"/g" /etc/php5/apache2/php.ini

# Add image configuration and scripts
ADD run.sh /run.sh
RUN chmod 755 /*.sh

# Configure /app folder with sample app
RUN mkdir -p /app && rm -fr /var/www/html && ln -s /app /var/www/html

RUN cd /app && \
    curl -o typecho-master.zip -L https://github.com/typecho/typecho/archive/master.zip && \
    unzip typecho-master.zip && rm typecho-master.zip

RUN apt-get purge --auto-remove -y unzip && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

WORKDIR /app
VOLUME ["/app/usr/themes","/app/usr/plugins","/app/usr/uploads"]
EXPOSE 80
CMD ["/run.sh"]
