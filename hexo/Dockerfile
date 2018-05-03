FROM node:alpine

ENV GIT_USER=izuolan
ENV GIT_EMAIL=i@zuolan.me

WORKDIR /hexo

RUN apk add --update --no-cache git openssh entr && \
    npm install hexo-cli -g && \
    rm -rf /var/cache/apk/* && \
    rm -rf /tmp/*

COPY monitor.sh /monitor.sh
VOLUME ["/hexo", "/root/.ssh"]
        
CMD ["sh", "/monitor.sh"]
