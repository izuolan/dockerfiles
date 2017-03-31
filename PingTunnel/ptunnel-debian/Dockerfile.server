FROM debian:jessie
RUN apt-get update && \
    apt-get install ptunnel -y && \
    apt-get clean
#ENV PASSWD=password
# EXPOSE 8000
ENTRYPOINT ["/usr/sbin/ptunnel"]
