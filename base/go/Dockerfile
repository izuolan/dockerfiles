FROM alpine
MAINTAINER izuolan <i@zuolan.me>

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

RUN apk update && apk upgrade
RUN apk add ca-certificates curl make git bzr mercurial go@community

RUN rm -rf /var/cache/apk/*

ENV GOPATH /go
ENV GO15VENDOREXPERIMENT 1
