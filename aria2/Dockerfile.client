FROM nginx:alpine
RUN apk add --no-cache --update --virtual build-dep wget unzip && \
    wget --no-check-certificate https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip && \
    unzip master.zip && rm master.zip && \
    rm -rf /usr/share/nginx/html/ && \
    mv /AriaNg-DailyBuild-master/ /usr/share/nginx/html && \
    apk del build-dep
