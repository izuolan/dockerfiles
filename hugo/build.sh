#!/bin/bash
VERSION=0.20.2
wget https://github.com/spf13/hugo/releases/download/v${VERSION}/hugo_${VERSION}_Linux-64bit.tar.gz
tar xf hugo_${VERSION}_Linux-64bit.tar.gz
mv hugo_${VERSION}_linux_amd64/hugo_${VERSION}_linux_amd64 hugo
docker build -t zuolan/hugo .
