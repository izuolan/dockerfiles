FROM alpine:edge

ARG LEANOTE_VERSION=2.5

RUN apk add --no-cache --update wget ca-certificates \
    && wget https://jaist.dl.sourceforge.net/project/leanote-bin/${LEANOTE_VERSION}/leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz \
    && tar -zxf leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz -C / \
    && rm -rf /leanote/mongodb_backup \
    && rm leanote-linux-amd64-v${LEANOTE_VERSION}.bin.tar.gz \
    && chmod a+x /leanote/bin/run.sh && chmod a+x /leanote/bin/leanote-linux-amd64 \
    && sed -i '/chmod/d' /leanote/bin/run.sh \
    && apk del --purge wget

VOLUME /leanote/public/upload

EXPOSE 9000

CMD ["/leanote/bin/run.sh"]
