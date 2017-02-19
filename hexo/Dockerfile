FROM mhart/alpine-node
WORKDIR /hexo

RUN apk add --update --no-cache git openssh inotify-tools && \
    npm install hexo-cli -g && \
    hexo init . && \
    npm install && \
    rm -rf /tmp/*

RUN npm install --save hexo-generator-sitemap && \
    npm install --save hexo-generator-feed && \
    npm install --save hexo-deployer-git && \
    npm install --save hexo-renderer-jade && \
    npm install --save hexo-generator-archive

COPY monitor.sh /monitor.sh
RUN chmod a+x /monitor.sh
 
VOLUME ["/hexo/source", \
        "/hexo/themes", \
        "/hexo/public", \
        "/root/.ssh", \
        "/root/.gitconfig"]

EXPOSE 4000
CMD ["/monitor.sh"]
