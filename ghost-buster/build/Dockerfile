FROM node:4.4
MAINTAINER ZuoLan <i@zuolan.me>

ENV GHOST_VERSION 0.8.0
ENV BASE_PACKAGE="git wget inotify-tools python-setuptools python-dev libxml2-dev libxslt-dev"
ENV EXTEND_PACKAGE="curl unzip gcc make"
ENV NODE_ENV="production"

# Install Base Package
RUN apt-get update && \
    apt-get install ${BASE_PACKAGE} ${EXTEND_PACKAGE} -yq
RUN easy_install pip && \
    pip install buster

# Install Ghost
RUN cd /tmp && \
    curl -sSL "https://ghost.org/archives/ghost-${GHOST_VERSION}.zip" -o ghost.zip && \
    unzip ghost.zip -d /ghost && rm -f ghost.zip && \
    cd /ghost && \
    npm cache clean && \
    npm install --production -d
RUN npm install -g ghost-export && \
    sed 's/127.0.0.1/0.0.0.0/' /ghost/config.example.js > /ghost/config.js && \
    useradd ghost --home /ghost

WORKDIR /ghost
ADD start.sh /start.sh
ADD publish.sh /ghost/publish.sh
RUN chmod +x /ghost/publish.sh

# Clean cache
RUN apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache clean

VOLUME ["/export.md", "/ghost/content"]

EXPOSE 2368

CMD ["bash", "/start.sh"]
