FROM ubuntu:trusty
MAINTAINER ZuoLan <i@zuolan.me>

RUN apt-get update && \
    apt-get -y install \
    nginx \
    ca-certificates \
    php5 php5-fpm php5-cli php5-json php5-mysql php5-curl php5-sqlite

ENV PAGEKIT_VERSION 1.0.3
RUN mkdir /pagekit
WORKDIR /pagekit
VOLUME /pagekit

ADD nginx.conf /etc/nginx/nginx.conf

RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["sh", "-c", "chown -R www-data: /pagekit && service php5-fpm start && nginx"]
