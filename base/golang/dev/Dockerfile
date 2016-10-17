FROM alpine:edge

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
  && echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
  && apk update && apk upgrade \
  && apk add ca-certificates curl make git bzr mercurial go@community alpine-sdk \
  && rm -rf /var/cache/apk/* \
  && mkdir /go
ENV GOPATH /go