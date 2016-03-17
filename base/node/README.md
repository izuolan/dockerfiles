## Build

**NOTE: Temporarily using [mhart/alpine-node](https://github.com/mhart/alpine-node) for v5 images until Alpine package updated.**

## mhart version

```sh
docker build -t yourname/node:latest -f Dockerfile.mhart .
```

## Normal version

```sh
docker build -t yourname/node:latest .
```

## Push

```sh
docker push yourname/node
```
