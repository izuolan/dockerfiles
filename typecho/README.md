Typecho images. Base on [tutum/lamp](https://hub.docker.com/r/tutum/lamp/).

#### [Dockerfile](https://github.com/izuolan/dockerfiles/tree/master/typecho)
#### Build
`docker build -t yourname/typecho .`

#### Run
`docker run -d -p 80:80 -p 3306:3306 -e MYSQL_PASS="mypass" yourname/typecho`

