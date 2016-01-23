Cloud9 IDE Dockerfile
================

This repository contains Dockerfile of Cloud9 IDE with some usefull features for convenience and secure development environment for Docker's automated build published to the public Docker Hub Registry.

## features:
- Auto protect the IDE with user defined (or default) password.
- SSH access to the container using user defined(or generated) password and or user defined SSH key.
- Custom container workspace directory (make it easier to link with VOLUME_FROM other container, not just host directory mapping).
- Optimized build process (please suggest if any idea to make it better)

# Base Docker Image
[tutum/ubuntu:trusty](https://registry.hub.docker.com/u/tutum/ubuntu/)

# Installation

## Install Docker.

Download automated build from public Docker Hub Registry: 

    docker pull agungf/cloud9-ide

alternatively, you can build an image from Dockerfile:

    docker build -t="$USER/cloud9-ide" github.com/agungf/cloud9-ide
    
    
## Basic Usage

    docker run -it -d -p 8181:8181 -p 2222:22 agungf/cloud9-ide
    
It will take care all the defaults to:

- Cloud9 Basic http auth User `root` , with DEFAULT password: `secret`
- See Auto generated SSH password for root at log, `docker logs <continer instance name>`
- Workspace directory at `/cloud9/workspace` 
    
You can add a workspace as a volume directory with the argument *-v /your-path/workspace/:cloud9/workspace* like this :

    docker run -it -d -p 8181:8181 -v /your-path/workspace/:/cloud9/workspace agungf/cloud9-ide


## Advance Usage

Get the latest version from github

    git clone https://github.com/agungf/cloud9-ide
    cd cloud9-ide/

Run with docker compose:

    docker-compose up -d
    
Example docker-compose.yml:

    ide:
      build: .
      environment:
        - ROOT_PASS=thesecrets
        - C9_WORKSPACE=/data/workspace
      volumes_from:
        - data
      ports:
        - 8181:8181
        - 22
    data
        image:tutum/ubuntu
        volumes:
        - /data/workspace


It will set the parameters to:

- Cloud9 Basic hhtp Auth User `root` , with password: `thesecrets`
- SSH root password : `thesecrets`
- Workspace directory at `/data/workspace` linked to VOLUME_FROM `data` container
 

## Set SSH Key
 
 [See tutum/ubuntu README](https://github.com/tutumcloud/tutum-ubuntu/blob/master/README.md)


Happy Coding !!
