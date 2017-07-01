FROM alpine
RUN apk update && apk add --virtual BUILD g++ linux-headers git make && \
    apk add --no-cache libstdc++ libgcc && \
    git clone https://github.com/friedrich/hans.git && \
    cd /hans && make && chmod a+x /hans/hans && \
    mv /hans/hans /bin/hans && rm -rf /hans && \
    apk del BUILD
ENTRYPOINT ["hans"]
