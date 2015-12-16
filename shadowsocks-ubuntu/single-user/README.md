基于ubuntu的shadowsocks的Docker镜像

**以下部分与这仓库无关，下面部分是已经构建好的部署说明，可以直接执行部署**

##部署说明

1.安装并测试Docker，可以参考官方文档。或者是《Docker入门与实践》安装一节。

2.拉取镜像

`docker pull index.alauda.cn/dubuqingfeng/ubuntu-shadowsocks:vps`

3.运行容器

`docker run -d -p 1984:1984 index.alauda.cn/dubuqingfeng/ubuntu-shadowsocks:vps -p 1984 -k sspassword -m aes-256-cfb`

3.测试运行

`docker ps -a`

如果出现up即为安装成功。

##配置说明

`docker run -d -p 1984:1984 index.alauda.cn/dubuqingfeng/ubuntu-shadowsocks:vps -p 1984 -k sspassword -m aes-256-cfb`

1984即为服务器端口。

sspassword为连接密码，自行更换。

aes-256-cfb为加密方式。

也可以使用`-c /etc/shadowsocks.json`参数。
