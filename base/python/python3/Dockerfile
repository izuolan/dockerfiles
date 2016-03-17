FROM alpine
MAINTAINER izuolan <i@zuolan.me>

RUN apk update && apk upgrade

RUN apk add ca-certificates python3

# Clean APK cache
RUN rm -rf /var/cache/apk/*
