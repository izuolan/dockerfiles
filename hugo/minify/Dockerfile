FROM mhart/alpine-node
WORKDIR /work
COPY . /work
RUN mkdir /work/html && \
    npm install && \
    apk add --no-cache inotify-tools && \
    chmod a+x /work/run.sh
VOLUME ["/work/html"]
CMD ["/work/run.sh"]
