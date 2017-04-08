Cloud9 IDE Dockerfile
================

This repository contains Dockerfile of Cloud9 IDE with some usefull features for convenience and secure development environment for Docker's automated build published to the public Docker Hub Registry.

## features:
- Auto protect the IDE with user defined (or default) password.
- Custom container workspace directory (make it easier to link with VOLUME_FROM other container, not just host directory mapping).
- Optimized build process (please suggest if any idea to make it better)

## Base Docker Image

* ubuntu:latest

## Installation

#### Basic Usage

```
docker run -dit --name=cloud9 \
    -p 8181:8181 \
    -v /yourpath/workspace/:/workspace \
    zuolan/cloud9-ide --auth username:password
```

#### Image Tag

* zuolan/cloud9-ide:latest -- Base on Debian, and minimize installation.
* zuolan/cloud9-ide:ubuntu -- Base on Ubuntu, and minimize installation.
* zuolan/cloud9-ide:full   -- Base on ubuntu, and save build tools.
* zuolan/cloud9-ide:swift  -- Base on ubuntu, and installed Swift for Linux.

#### Build and run your image

Build latest image:
```
docker build -t yourname/cloud9-ide -f Dockerfile .
```

Build full image:
```
docker build -t yourname/cloud9-ide:full -f Dockerfile.full .
```

Build Ubuntu image:
```
docker build -t yourname/cloud9-ide:ubuntu -f Dockerfile.ubuntu .
```

Build Swift image:
```
docker build -t yourname/cloud9-ide:swift -f Dockerfile.swift .
```

Happy Coding !!

----

## Contect Me
No matter where I am, will be immediately received.
My Email: `echo "aUB6dW9sYW4ubWUK" | base64 -d`