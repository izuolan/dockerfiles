FROM alpine:edge
RUN apk update && apk upgrade \
  && apk add ca-certificates curl python3-dev \
  && curl -sS https://bootstrap.pypa.io/get-pip.py | python3 \
  && apk del curl && rm -rf /var/cache/apk/*
