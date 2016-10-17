FROM alpine:edge
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories \
  && echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories \
  && apk update \
  && apk upgrade \
  && apk add ca-certificates openjdk8@community \
  && rm -rf /var/cache/apk/*

# set javac PATH
ENV PATH=/usr/lib/jvm/java-1.8-openjdk/bin:$PATH
