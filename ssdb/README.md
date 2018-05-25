#### [ssdb](http://ssdb.io/)

Port: 8890
Volume: /ssdb/var
Config: /ssdb/ssdb.conf

via Docker:

```shell
$ docker pull zuolan/ssdb
$ docker run -d --name ssdb -p 8890:8890 \
    -v /path/ssdb/var:/ssdb/var \
    -v /path/ssdb/ssdb.conf:/ssdb/ssdb.conf:ro \
    --restart=always zuolan/ssdb
```

via Docker-Compose:

```shell
$ docker-compose up -d
```
