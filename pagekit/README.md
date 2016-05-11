## Pagekit
Docker image for the Pagekit CMS

**Uses nginx + php5-fpm**

## Usage
```
$ docker run -d -p 8000:80 pagekit/pagekit
```

## Use with a MySQL container
```
$ docker run -d \
  -e MYSQL_ROOT_PASSWORD=YOURPASSWORD \
  -e MYSQL_DATABASE=pagekit
  --name pagekit-mysql
  mysql
```
```
$ docker run -d \
  -p 8000:80 \
  --link pagekit-mysql:mysql \
  pagekit/pagekit
```
On install, use `mysql` as host.

## Use Docker-compose

* `mkdir ~/pagekit && cd ~/pagekit && vim docker-compose.yml`
```
version: '2'
services:
  db:
    image: mysql
    expose:
        - "3306"
    environment:
        - MYSQL_ROOT_PASSWORD=YOURPASSWORD
        - MYSQL_DATABASE=pagekit
    volumes:
        - ~/pagekit/mysql:/var/lib/mysql
  pagekit:
    image: pagekit/pagekit
    ports:
        - "8000:80"
    links:
        - db:db
    volumes:
        - ~/pagekit/storage:/pagekit/storage
        - ~/pagekit/app/cache:/pagekit/app/cache
```
* Change your password `YOURPASSWORD`
* Run `cd ~/pagekit && docker-compose up -d`
* On install, use `db` as host.
