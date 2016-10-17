FROM alpine:edge
RUN apk update && apk upgrade \
  && apk add ca-certificates php5 php5-phar php5-json php5-openssl php5-curl \
  && rm -rf /var/cache/apk/*
