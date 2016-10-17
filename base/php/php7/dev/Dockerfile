FROM alpine:edge

RUN apk update && apk upgrade \
  && apk add ca-certificates curl php7-dev@testing \
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/local/bin/composer \
  && apk del curl && rm -rf /var/cache/apk/*
