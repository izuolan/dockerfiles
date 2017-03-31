FROM alpine:edge
COPY . /build
WORKDIR /build
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache \
    libpcap-dev \
    linux-headers && \
    apk add --no-cache --virtual BUILD build-base && \
    make && make install && \
    apk del BUILD
