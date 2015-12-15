FROM ubuntu:14.04
MAINTAINER Sven Hartmann <sid@sh87.net>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

RUN apt-mark hold initscripts udev plymouth mountall
RUN dpkg-divert --local --rename --add /sbin/initctl && ln -sf /bin/true /sbin/initctl

RUN sed -i "/^# deb.*multiverse/ s/^# //" /etc/apt/sources.list

RUN apt-get update && apt-get upgrade -y --force-yes && apt-get dist-upgrade -y --force-yes \
    && apt-get install -y --force-yes --no-install-recommends supervisor \
        openssh-server sudo \
        net-tools \
        lxde-core lxde-icon-theme x11vnc xvfb screen openbox \
        nodejs wget \
        firefox \
	htop bmon nano \
	lxterminal \
#	vnc-java \
    && apt-get autoclean \
    && apt-get autoremove \
    && rm -rf /var/lib/apt/lists/*
    
### Install Java 8 and JNA
#RUN echo "deb http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee /etc/apt/sources.list.d/webupd8team-java.list
#RUN echo "deb-src http://ppa.launchpad.net/webupd8team/java/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/webupd8team-java.list
#RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys EEA14886
#RUN apt-get update -y
#RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | sudo /usr/bin/debconf-set-selections
#RUN apt-get install -y --force-yes oracle-java8-installer
#RUN apt-get install -y --force-yes oracle-java8-set-default
#RUN mkdir /tmp/jna-4.0.0 && \
#	cd /tmp/jna-4.0.0 && \
#	wget --no-check-certificate 'https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna/4.0.0/jna-4.0.0.jar' && \
#	wget --no-check-certificate 'https://maven.java.net/content/repositories/releases/net/java/dev/jna/jna-platform/4.0.0/jna-platform-4.0.0.jar' && \
#	cd /tmp/jna-4.0.0 && \
#	cd /usr/share/java && \
#	[ -f jna.jar ] && rm jna.jar || \
#	cp /tmp/jna-4.0.0/*.jar . && \
#	ln -s jna-4.0.0.jar jna.jar && \
#	ln -s jna-platform-4.0.0.jar jna-platform.jar && \
#	java -jar jna.jar
    
ADD startup.sh /
ADD supervisord.conf /
EXPOSE 5800
EXPOSE 5900
EXPOSE 22
WORKDIR /
ENTRYPOINT ["/startup.sh"]
