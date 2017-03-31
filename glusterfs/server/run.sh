#!/bin/bash

[ "$DEBUG" == "1" ] && set -x

/etc/init.d/glusterfs-server start

if [ "${GLUSTER_PEER}" == "**ChangeMe**" ]; then
   # This node is not connecting to the cluster yet
   exit 0
fi

echo "=> Waiting for glusterd to start..."
sleep 5

if gluster peer status | grep ${GLUSTER_PEER} >/dev/null; then
   echo "=> This peer is already part of Gluster Cluster, nothing to do..."
   exit 0
fi

echo "=> Probing peer ${GLUSTER_PEER}..."
gluster peer probe ${GLUSTER_PEER}

echo "=> Creating GlusterFS volume ${GLUSTER_VOL_NAME}..."
gluster volume create ${GLUSTER_VOL_NAME} replica ${GLUSTER_REPLICA} ${SERVER_IP}:${GLUSTER_BRICK_PATH} ${GLUSTER_PEER}:${GLUSTER_BRICK_PATH} force

echo "=> Starting GlusterFS volume ${GLUSTER_VOL_NAME}..."
gluster volume start ${GLUSTER_VOL_NAME}

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
