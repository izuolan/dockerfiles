FROM node:slim
MAINTAINER izuolan <i@zuolan.me>

RUN buildDeps='make build-essential g++ gcc python2.7' && softDeps="git" && \
    apt-get update && apt-get upgrade -y && \
    apt-get install -y $buildDeps $softDeps --no-install-recommends && \
    yarn global add forever && \
    git clone https://github.com/c9/core.git /cloud9 && cd /cloud9 && \
    scripts/install-sdk.sh && \
    git reset HEAD --hard && \
    npm i -g npm && \
    apt-get purge -y --auto-remove $buildDeps && \
    apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
 
VOLUME /workspace
EXPOSE 8181 
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
# CMD["--auth","username:password"]
