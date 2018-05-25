FROM alpine as build

ARG VERSION=${VERSION:-master}

RUN apk add --no-cache \
      curl tar \
      gcc g++ make autoconf \
      libc-dev libevent-dev linux-headers perl \
    && mkdir -p /ssdb/tmp \
    && curl -Lk "https://github.com/ideawu/ssdb/archive/${VERSION}.tar.gz" | \
       tar -xz -C /ssdb/tmp --strip-components=1 \
    && cd /ssdb/tmp \
    && make -j$(getconf _NPROCESSORS_ONLN) \
    && make install PREFIX=/ssdb \
    && sed -e "s@home.*@home $(dirname /ssdb/var)@" \
           -e "s/loglevel.*/loglevel info/" \
           -e "s@work_dir = .*@work_dir = /ssdb/var@" \
           -e "s@pidfile = .*@pidfile = /run/ssdb.pid@" \
           -e "s@output:.*@output: stdout@" \
           -e "s@level:.*@level: info@" \
           -e "s@ip:.*@ip: 0.0.0.0@" \
           -i /ssdb/ssdb.conf \
    && rm -rf /ssdb/tmp

FROM alpine

RUN apk add --no-cache libstdc++

COPY --from=build /ssdb/ /ssdb/

EXPOSE 8890
VOLUME /ssdb/var

CMD ["/ssdb/ssdb-server", "/ssdb/ssdb.conf"]