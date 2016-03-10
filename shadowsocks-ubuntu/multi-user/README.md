#### Edit `/your-path/shadowsocks.json` in your local
```
{
    "server":"0.0.0.0",
    "local_address": "127.0.0.1",
    "local_port":1080,
    "port_password":{
         "11216":"pass11216",
         "11217":"pass11217",
         "11218":"pass11218",
         "11219":"pass11219",
         "11220":"pass11220"
    },
    "timeout":300,
    "method":"aes-256-cfb",
    "fast_open": false
}

```

#### Run
```
docker run -d -v /your-path/shadowsocks.json:/etc/shadowsocks.json -p 11216-11220:11216-11220 zuolan/shadowsocks-multi-user
```

#### Test

`docker ps -a`

`docker logs [Container ID]`
