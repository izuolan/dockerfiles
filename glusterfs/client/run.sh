#!/bin/bash

set -e

[ "$DEBUG" == "1" ] && set -x && set +e

/etc/init.d/glusterfs-server start
sleep 5

if [ "${GLUSTER_PEER}" == "**ChangeMe**" ]; then
   echo "ERROR: You did not specify "GLUSTER_PEER" environment variable - Exiting..."
   exit 0
fi

ALIVE=0
for PEER in `echo "${GLUSTER_PEER}" | sed "s/,/ /g"`; do
    echo "=> Checking if I can reach GlusterFS node ${PEER} ..."
    if ping -c 10 ${PEER} >/dev/null 2>&1; then
       echo "=> GlusterFS node ${PEER} is alive"
       ALIVE=1
       break
    else
       echo "*** Could not reach server ${PEER} ..."
    fi
done

if [ "$ALIVE" == 0 ]; then
   echo "ERROR: could not contact any GlusterFS node from this list: ${GLUSTER_PEER} - Exiting..."
   exit 1
fi

echo "=> Mounting GlusterFS volume ${GLUSTER_VOL_NAME} from GlusterFS node ${PEER} ..."
mount -t glusterfs ${PEER}:/${GLUSTER_VOL_NAME} ${GLUSTER_VOL_PATH}

# public_ip=`dig -4 @ns1.google.com -t txt o-o.myaddr.l.google.com +short | sed "s/\"//g"`

/usr/bin/supervisord -c /etc/supervisor/conf.d/supervisord.conf
