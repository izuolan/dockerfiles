FROM alpine:3.4

RUN if [ $(wget -qO- ipinfo.io/country) == CN ]; then echo "http://mirrors.ustc.edu.cn/alpine/v3.4/main/" > /etc/apk/repositories ;fi  \
    &&  apk update && apk upgrade \
    && apk add --no-cache git py-pip libsodium

RUN pip install --no-cache-dir git+https://github.com/breakwa11/shadowsocks.git@manyuser