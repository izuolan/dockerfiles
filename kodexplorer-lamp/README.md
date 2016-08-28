# KODExplorer-dockerfile
KODExplorer for docker
```
docker run -d -p 80:80 -p 3306:3306 -e MYSQL_PASS="mypass" -v /app:/app -v /data:/var/lib/mysql zuolan/kode
```

