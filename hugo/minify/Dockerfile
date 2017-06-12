FROM mhart/alpine-node
ENV BASE_URL=http://example.com/
COPY . /work
RUN cd /work && npm install && \
    apk add --no-cache hugo && \
    chmod a+x /work/run.sh
WORKDIR /hugo
CMD ["/work/run.sh"]
