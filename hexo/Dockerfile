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
VOLUME [ "/www/_config.yml", "/www/source", "/www/themes", "/root/.ssh/id_rsa", "/config" ]
RUN npm install --no-optional hexo-cli -g \
  && npm install --no-optional hexo --save \
  && hexo init

# 配置 Webdav
ADD webdav/* /etc/lighttpd/
ADD webdav.sh /www/webdav.sh
RUN chmod u+x /www/webdav.sh

# 配置 inotifywait
ADD ./entrypoint.sh /www/entrypoint.sh
RUN chmod u+x /www/entrypoint.sh

EXPOSE 4000
ENTRYPOINT ["/www/entrypoint.sh"]

