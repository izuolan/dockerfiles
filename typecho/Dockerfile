FROM ubuntu:trusty
MAINTAINER ZuoLan <i@zuolan.me>

ENV base="ca-certificates nginx php5 php5-fpm php5-cli php5-json php5-mysql php5-curl"
ENV build="unzip"
RUN apt-get update && \
    apt-get install -y ${base} ${build}

RUN mkdir /typecho
WORKDIR /typecho
VOLUME /typecho/usr

RUN cd /typecho && \
    curl -o typecho-master.zip -L https://github.com/typecho/typecho/archive/master.zip && \
    unzip typecho-master.zip && rm typecho-master.zip

ADD nginx.conf /etc/nginx/nginx.conf

RUN chown -R www-data: /typecho && \
    apt-get purge --auto-remove -y ${build} && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

CMD ["sh", "-c", "service php5-fpm start && nginx"]
