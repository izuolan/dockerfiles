FROM ubuntu
MAINTAINER ZuoLan <i@zuolan.me>

ENV buildDeps="make build-essential g++ gcc curl ca-certificates git" \
    c9Deps="nodejs" \
    swiftDeps="curl python-dev libedit2 clang libicu52 libxml2"

# If you use Swift package, may be need install libicu-dev, so you can use libicu-dev instead of libicu52.
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y $buildDeps --no-install-recommends && \
    curl -sL https://deb.nodesource.com/setup_4.x | sudo bash - && \
    apt-get -y install $c9Deps $swiftDeps && \
    npm install -g forever && npm cache clean && \
    git clone https://github.com/c9/core.git /cloud9 && cd /cloud9 && \
    scripts/install-sdk.sh && \
    # Install Swift
    cd /usr/local/ && \
    curl -o swift.tar.gz -sL https://swift.org/builds/swift-3.0-release/ubuntu1404/swift-3.0-RELEASE/swift-3.0-RELEASE-ubuntu14.04.tar.gz && \
    tar xzf swift.tar.gz && mv swift-3.0-RELEASE-ubuntu14.04 swift && rm /usr/local/swift.tar.gz && \
    echo 'export PATH=/usr/local/swift/usr/bin:"${PATH}"' >> ~/.bashrc && \
    apt-get autoremove -y $buildDeps && \
    apt-get autoremove -y && apt-get autoclean -y && apt-get clean -y && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm cache clean

VOLUME /workspace
EXPOSE 8181
ENTRYPOINT ["forever", "/cloud9/server.js", "-w", "/workspace", "-l", "0.0.0.0"]
#CMD["--auth","username:password"]