FROM alpine:edge
MAINTAINER izuolan <i@zuolan.me>

# 添加软件源
RUN echo '@edge http://nl.alpinelinux.org/alpine/edge/main' >> /etc/apk/repositories
RUN echo '@community http://nl.alpinelinux.org/alpine/edge/community' >> /etc/apk/repositories

# 整理需要安装的软件
ENV BASE_PACKAGE="ca-certificates git nodejs-dev@edge nodejs@edge"
ENV EXTEND_PACKAGE="curl lighttpd lighttpd-mod_webdav lighttpd-mod_auth inotify-tools"

# 安装基础软件并清理缓存
RUN apk update && apk upgrade \
  && apk add --no-cache ${BASE_PACKAGE} ${EXTEND_PACKAGE} \
  && mkdir /www \
  && rm -rf /var/cache/apk/*

# 初始化 Hexo
WORKDIR /www
RUN npm install --no-optional hexo-cli -g \
  && npm install --no-optional hexo --save
VOLUME [ "/www", "/root/.ssh", "/config" ]

# 配置 Webdav
ADD webdav/* /etc/lighttpd/
ADD webdav.sh /webdav.sh
RUN chmod a+x /webdav.sh

# 配置 inotifywait
ADD ./entrypoint.sh /entrypoint.sh
RUN chmod a+x /entrypoint.sh

EXPOSE 4000
ENTRYPOINT ["/entrypoint.sh"]
