FROM alpine:edge
RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache ca-certificates wget mongodb-tools
EXPOSE 27017
VOLUME /data/db
CMD ["mongod"]
