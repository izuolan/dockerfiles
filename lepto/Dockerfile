FROM node:alpine
RUN apk --repository http://dl-3.alpinelinux.org/alpine/edge/testing \
    add --update --no-cache vips-tools vips-dev fftw-dev && \
    apk add --update --no-cache --virtual build-tools make g++ && \
    yarn global add lepto-cli && \
    apk del build-tools && \
    rm -rf /var/cache/apk/*
WORKDIR /srv
EXPOSE 4490
VOLUME ["/srv"]
CMD ["lepto"]
