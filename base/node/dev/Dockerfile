FROM alpine:edge
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
  && apk update && apk upgrade \
  && apk add ca-certificates git nodejs-dev@edge nodejs@edge \
  && npm install -g npm \
  && rm -rf /var/cache/apk/*
