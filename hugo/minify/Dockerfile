FROM mhart/alpine-node
WORKDIR /work
COPY . /work
RUN mkdir /work/html && \
    npm install
VOLUME ["/work/html"]
CMD ["/work/run.sh"]
