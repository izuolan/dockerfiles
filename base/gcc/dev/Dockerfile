FROM alpine:edge

RUN apk update && apk upgrade \
  && apk add ca-certificates build-base boost \
  && rm -rf /var/cache/apk/*
