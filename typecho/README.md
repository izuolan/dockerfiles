[Dockerfile](https://github.com/izuolan/dockerfiles/tree/master/typecho)

## 安装
* 第一步：克隆 Typecho 仓库
```
git clone https://github.com/typecho/typecho.git ~/app/
```
没把 Typecho 放进镜像只是为了减少体积，方便更新罢了。

* 第二步：启动容器，同时修改目录权限，避免安装异常
端口`9090`可以修改，数据卷修改的话，记得下面路径也要修改为一样的。
```
docker run --name=blog --restart=always -d -v ~/app:/srv/ -p 9090:2015 zuolan/typecho && chmod 777 ~/app/usr && chmod 777 ~/app
```
然后打开网页一路安装完成。

## 使用 HTTPS
获取证书之后，使用命令进入容器：
```
docker exec -it blog sh
```
编辑文件：
```
vi config.inc.php
```
添加一行`define('__TYPECHO_SECURE__',true);`
保存，使用`exit`退出容器，然后重启容器：
```
docker restart blog
````

#### Build
`docker build -t yourname/typecho .`

