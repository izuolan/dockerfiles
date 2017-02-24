FROM alpine
WORKDIR /hugo
ENV GIT_USER=izuolan \
    GIT_EMAIL=i@zuolan.me \
    MINIFY_IMAGE=zuolan/hugo:minify \
    HUGO_PUBLIC=/hugo/public
COPY run.sh /run.sh
RUN apk add --no-cache inotify-tools hugo && \
    chmod a+x /run.sh
VOLUME ["/hugo"]
CMD ["bash", "/run.sh"]
