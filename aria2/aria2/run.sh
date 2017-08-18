#!/bin/sh
mkdir -p aria2/downloads
eval sed -i 's/RPC_PASSWORD/$PASSWORD/g' /aria2/aria2c.conf 

aria2c --conf-path=/aria2/aria2c.conf &
nginx -g "daemon off;"
