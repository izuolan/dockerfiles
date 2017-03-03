FROM alpine:edge

RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories && \
    echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories && \
    echo '@testing http://nl.alpinelinux.org/alpine/edge/testing' >> /etc/apk/repositories && \
    apk add --no-cache \
        ca-certificates \
        openjdk8@community \
        # genisoimage \
        libffi-dev \
        openssl-dev \
        git \
        sudo \
        bash \
        # ipmitool \
        maven \
        python-dev \
        py-setuptools \
        py2-pip \
        # python-mysql.connector \
        supervisor \
        py-mysqldb && \
        # build-base musl-dev make gcc libffi && \
    rm -rf /tmp/* /var/cache/apk/*

COPY supervisord.conf /etc/supervisor/conf.d/supervisord.conf
RUN git clone https://github.com/apache/cloudstack.git /root
WORKDIR /root
RUN mvn -Pdeveloper -Dsimulator -DskipTests -X -e clean install
