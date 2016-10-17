FROM alpine:edge

RUN apk update && apk upgrade \
  && apk add curl ca-certificates python-dev \
  && curl -sS https://bootstrap.pypa.io/get-pip.py | python \
  && apk del curl && rm -rf /var/cache/apk/*
