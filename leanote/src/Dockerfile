FROM golang:alpine
ARG LEANOTE_VERSION=2.3
RUN apk add --no-cache git && \
    go get -v github.com/revel/cmd/revel && \
    mkdir -p /go/src/github.com/leanote/leanote/ && \
    ln -s /go/src/github.com/leanote /leanote

VOLUME /leanote
EXPOSE 9000
CMD ["sh","/leanote/bin/run-linux-amd64.sh"]
