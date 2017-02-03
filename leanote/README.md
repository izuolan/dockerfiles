首先在这个文件夹内执行：
```
bash get-data.sh
```

然后执行：
```
docker-compose run --rm initdb
```

最后启动：
```
docker-compose up -d leanote
```

打开 localhost:9000 即可看到部署成功。
