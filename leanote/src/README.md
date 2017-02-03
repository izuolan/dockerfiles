这个文件夹存放的是从源代码安装 Leanote 的 Docker 配置文件。
也就是“开发版”。
使用方法也是先执行：
```
bash get-src.sh
```
然后执行数据库初始化：
```
docker-compose run --rm initdb
```
最后启动 Leanote 即可：
```
docker-compose up -d leanote
```
