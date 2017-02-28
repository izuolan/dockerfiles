FROM alpine
WORKDIR /hugo
COPY run.sh /run.sh
RUN apk add --no-cache inotify-tools hugo && \
    chmod a+x /run.sh
VOLUME ["/hugo"]
CMD ["/run.sh"]
