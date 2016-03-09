基于ubuntu的shadowsocks的Docker镜像

**以下是多用户的部署情况**

##部署说明

1.安装并测试Docker，可以参考官方文档。

2.拉取镜像

3.运行容器

`docker run -d -v /path/shadowsocks.json：/etc/shadowsocks.json -p 20101-21231:20101-21231 [Images Name] -c /etc/shadowsocks.json`

3.测试运行

`docker ps -a`

如果出现up即为安装成功。

##配置说明
