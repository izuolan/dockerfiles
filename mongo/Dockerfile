FROM alpine:edge
RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
    apk add --no-cache ca-certificates mongodb wget mongodb-tools && \
    rm /usr/bin/mongosniff /usr/bin/mongoperf
EXPOSE 27017
VOLUME /data/db
CMD ["mongod"]
