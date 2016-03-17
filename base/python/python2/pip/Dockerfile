FROM alpine
MAINTAINER izuolan <i@zuolan.me>

RUN apk update && apk upgrade
RUN apk add curl ca-certificates python
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python

# Clean APK cache
RUN rm -rf /var/cache/apk/*
