FROM iron/java:1.8

RUN apk update && apk upgrade
RUN apk add bash wget unzip
RUN wget http://downloads.typesafe.com/scala/2.11.7/scala-2.11.7.tgz /usr/local/share/scala/scala-2.11.7.tgz
RUN cd /usr/local/share/scala/ && \
    unzip scala-2.11.7.tgz /usr/local/share/scala && \
    rm scala-2.11.7.tgz

# Clean APK cache
RUN apk del wget unzip && \
    rm -rf /var/cache/apk/* /tmp/*
ENV SCALA-HOME=/usr/local/share/scala
ENV PATH=/usr/local/share/scala/bin:$PATH
