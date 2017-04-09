FROM alpine:edge
COPY . /build
WORKDIR /build
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache \
    libpcap && \
    apk add --no-cache --virtual BUILD linux-headers libpcap-dev build-base && \
    make && make install && \
    apk del BUILD && \
    mv /build/client.sh /run.sh && \
    rm -rf /build /var/cache/apk/* && \
    chmod a+x /run.sh
ENV IP=127.0.0.1 MIDDLE_PORT=8000 SSH_PORT=22 PASSWORD=pasword
CMD ["/run.sh"]
