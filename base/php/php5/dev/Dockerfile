FROM alpine:edge
RUN apk update && apk upgrade \
  && apk add ca-certificates curl php5-dev php5-phar php5-json php5-openssl php5-curl \
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && apk del curl && rm -rf /var/cache/apk/*
