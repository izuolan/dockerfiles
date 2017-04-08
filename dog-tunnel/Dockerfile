FROM alpine

# 指明通道行为，服务器端默认不指定，客户端指定。
ENV ACTION=""

# 登录验证，服务端和客户端相同。
ENV AUTH="yourpassword"

# DNS 缓存时间（分钟），有加速效果。
ENV DNSCACHE="10"

# 客户端端口
ENV LOCAL_PORT="1080"

# 服务端端口
ENV SERVER_PORT="9090"

# TCP 模式（默认为UDP）
ENV TCP="false"

# 通道个数，默认1，最大100。
ENV PIPE="10"

# UDP 握手加密，服务端和客户端需一致。
ENV XOR="secret"

# 会话销毁
ENV TIMEOUT="30"

# Socks5 智能代理
ENV SMARTN="3"

RUN apk update && \
    apk add git make go && \
    git clone https://github.com/vzex/dog-tunnel.git /dog-tunnel && \
    cd /dog-tunnel && \
    git checkout origin/udpVersion -b udp && \
    make client && \
    cp dtunnel_lite /usr/bin && \
    apk del run-parts openssl lua5.2-libs lua5.2 ncurses-terminfo ncurses-widec-libs lua5.2-posix ca-certificates libssh2 curl expat pcre git go make && \
    apk cache clean && \
    rm -rf /usr/lib/go && \
    rm -rf /dog-tunnel;
CMD ["/usr/bin/dtunnel_lite", "-service 0.0.0.0:${SERVER_PORT} -v -action ${ACTION} -xor ${XOR} -auth ${AUTH} -dnscache ${DNSCACHE}"]
# CMD ["/usr/bin/dtunnel_lite", "-service 0.0.0.0:${SERVER_PORT} -local :${LOCAL_PORT} -v -action ${ACTION} -xor ${XOR} -auth ${AUTH} -encrypt -session_timeout ${TIMEOUT} -smartN ${SMARTN} -pipe ${PIPE}"]