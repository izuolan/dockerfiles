FROM alpine
MAINTAINER izuolan <i@zuolan.me>

RUN apk update && apk upgrade \
  && apk add ca-certificates build-base boost \
  && rm -rf /var/cache/apk/*
