#!/bin/bash

[ "$DEBUG" == "1" ] && set -x

prepare-gluster.sh &
/usr/bin/supervisord
