FROM alpine
COPY aria2/aria2c.conf /aria2/aria2c.conf
RUN apk add --no-cache aria2
CMD ["aria2", "--conf-path=/aria2/aria2c.conf"]
