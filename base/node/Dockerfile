FROM alpine:edge

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
  && apk update && apk upgrade \
  && apk add ca-certificates nodejs@edge \
  && npm uninstall -g npm \
  && rm -rf /var/cache/apk/*
