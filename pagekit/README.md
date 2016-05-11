## Pagekit
Docker image for the Pagekit CMS

**Uses nginx + php5-fpm**

## Usage
```
$ docker run -d -p 8000:80 zuolan/pagekit
```

## Use with a MySQL container
```
$ docker run -d \
  -e MYSQL_ROOT_PASSWORD=<PASSWORD> \
  -e MYSQL_DATABASE=pagekit
  --name pagekit-mysql
  mysql
```
```
$ docker run -d \
  -p 8000:80 \
  --link pagekit-mysql:mysql \
  zuolan/pagekit
```

On install, use `mysql` as host.
