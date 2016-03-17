This image is for building your dependencies. You should use
zuolan/node to run them (smaller image).

## Build

**NOTE: Temporarily using [mhart/alpine-node](https://github.com/mhart/alpine-node) for v5 images until Alpine package updated.**

```sh
docker build -t yourname/node:dev -f Dockerfile.mhart .
```

or

```sh
docker build -t yourname/node:dev -f Dockerfile .
```

## Push

```sh
docker push yourname/node
```
