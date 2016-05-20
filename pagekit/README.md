[![Pagekit Banner](https://cloud.githubusercontent.com/assets/1716665/14317675/ba034b8c-fc09-11e5-81ed-f10f37d86ea5.png)](https://pagekit.com)

## Pagekit CMS

[![Build Status](https://travis-ci.org/pagekit/pagekit.svg?branch=develop)](https://travis-ci.org/pagekit/pagekit)

* [Dockerfile](https://github.com/izuolan/dockerfiles/tree/master/pagekit) `latest`
* [Pagekit.com](https://pagekit.com)
* [Github](https://github.com/pagekit/pagekit/)

Docker image for the Pagekit CMS

**Uses nginx + php5-fpm + MySQL**

## Usage
```
$ docker run -d -p 8080:80 pagekit/pagekit
```

## Use with a MySQL container
```
$ docker run -d \
  -e MYSQL_ROOT_PASSWORD=YOURPASSWORD \
  -e MYSQL_DATABASE=pagekit \
  --name pagekit-mysql \
  mysql
```
```
$ docker run -d \
  -p 8080:80 \
  --link pagekit-mysql:mysql \
  --name pagekit-web \
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
        - "8080:80"
    links:
        - db:db
    volumes:
        - ~/pagekit/storage:/pagekit/storage
        - ~/pagekit/app/cache:/pagekit/app/cache
```
* Change your password `YOURPASSWORD`
* Run `cd ~/pagekit && docker-compose up -d`
* On install, use `db` as host.
