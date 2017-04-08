FROM ubuntu
MAINTAINER ZuoLan <i@zuolan.me>

RUN apt-get update && \
    # Install dependencies
    apt-get -y install git curl build-essential supervisor && \
    # Install nodejs
    curl -sL https://deb.nodesource.com/setup | sudo bash - && \
    apt-get -y install nodejs && \
    npm install -g foreve && \
    # Install Cloud9 and Add workspace volumes
    git clone https://github.com/c9/core.git /cloud9 && cd /cloud9 && \
    scripts/install-sdk.sh && \
    # clean cache
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache clean

VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
#CMD["--auth","username:password"]