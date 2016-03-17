FROM alpine
MAINTAINER izuolan <i@zuolan.me>

RUN apk update && apk upgrade
RUN apk add ca-certificates python

# Clean APK cache
RUN rm -rf /var/cache/apk/*
