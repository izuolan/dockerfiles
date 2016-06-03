FROM node:0.12

RUN apt-get update && \
    apt-get install unzip python-setuptools python-dev libxml2-dev libxslt-dev -yq && \
    easy_install pip

# Install Ghost
ENV GHOST_VERSION 0.8.0
RUN cd /tmp && \
    curl -sSL "https://ghost.org/archives/ghost-${GHOST_VERSION}.zip" -o ghost.zip && \
    unzip ghost.zip -d /ghost && \
    rm -f ghost.zip

RUN cd /ghost && \
    npm cache clean && \
    npm install --production -d

RUN sed 's/127.0.0.1/0.0.0.0/' /ghost/config.example.js > /ghost/config.js && \
    useradd ghost --home /ghost

# Install Buster
RUN pip install buster

# Install Inotify
RUN apt-get install inotify-tools -y

# Install MD Exporter
RUN cd / ghost && \
    npm install -g ghost-export

# Clean cache
RUN apt-get autoremove unzip python-setuptools -y && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache clean

ADD start.bash /ghost-start
ADD publish.sh /ghost/publish.sh
RUN chmod +x /ghost/publish.sh

ENV NODE_ENV production

VOLUME ["/ghost/static", "/export.md", "/ghost-override"]

WORKDIR /ghost

EXPOSE 2368

CMD ["bash", "/ghost-start"]
