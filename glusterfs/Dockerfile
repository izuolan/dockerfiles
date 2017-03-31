FROM ubuntu:16.04

RUN apt-get update && \
    apt-get install -y python-software-properties software-properties-common && \
    add-apt-repository -y ppa:gluster/glusterfs-3.10 && \
    apt-get update && \
    apt-get install -y supervisor glusterfs-server && \
    apt-get autoremove -y python-software-properties software-properties-common && \
    apt-get autoclean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
