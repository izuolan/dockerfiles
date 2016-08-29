Typecho 镜像，PHP 5.6，适用 Mysql 和 Sqlite，基于 Ubuntu，镜像大小 88 MB 。

> 新建一个文件docker-compose.yml复制粘贴下面对应内容并适当修改，然后在文件当前目录执行执行`docker-compose up -d`即可。

**注意：默认主题和插件均已删除，你需要先复制主题到主题文件夹哦～ 不然看不了首页，后台无影响。**

#### Sqlite

```
version: '2'
services:
  typecho:
    container_name: blog
    image: zuolan/typecho:latest
    volumes:
      - "~/usr/themes:/app/usr/themes"
      - "~/usr/plugins:/app/usr/plugins"
      - "~/usr/uploads:/app/usr/uploads"
    ports:
      - "80:80"
    restart: always
```

#### Mysql

```
version: '2'
services:
  db:
    container_name: db
    image: mysql:5.7
    volumes:
      - "~/mysql:/var/lib/mysql"
    restart: always
    environment:
      MYSQL_ROOT_PASSWORD: 123456abcdef
      MYSQL_DATABASE: typecho
      MYSQL_USER: 6666user
      MYSQL_PASSWORD: 6666password
  typecho:
    container_name: blog
    depends_on:
      - db
    image: zuolan/typecho:latest
    links:
      - db
    volumes:
      - "~/usr/themes:/app/usr/themes"
      - "~/usr/plugins:/app/usr/plugins"
      - "~/usr/uploads:/app/usr/uploads"
    ports:
      - "80:80"
    restart: always
```

#### Build
`docker build -t yourname/typecho .`
