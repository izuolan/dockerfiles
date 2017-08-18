#### Aria2 RPC Server + AriaNg Web

```
docker run -d --name aria2 \
    -p 6800:6800 \
    -p 127.0.0.1:6880:80 \
    -e PASSWORD=your_password \
    zuolan/aria2
```

#### Only Aria2 RPC Server

```
docker run -d --name aria2 \
    -p 6800:6800 \
    -e PASSWORD=your_password \
    zuolan/aria2:server
```

#### Only AriaNg Web

```
docker run -d --name aria2 \
    -p 127.0.0.1:6880:80 \
    zuolan/aria2:client
```
