FROM alpine
MAINTAINER izuolan <i@zuolan.me>

RUN apk update && apk upgrade
RUN apk add ca-certificates curl python3
RUN curl -sS https://bootstrap.pypa.io/get-pip.py | python3

# Clean APK cache
RUN rm -rf /var/cache/apk/*
