FROM nginx:alpine
ENV PASSWORD=aria2
COPY aria2 /aria2
RUN apk add --no-cache --update --virtual build-dep wget unzip && \
    apk add aria2 && \
    wget https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip && \
    unzip master.zip && rm master.zip && \
    rm -rf /usr/share/nginx/html/ && \
    mv /AriaNg-DailyBuild-master/ /usr/share/nginx/html && \
    chmod a+x /aria2/run.sh && apk del build-dep
CMD ["/aria2/run.sh"]
