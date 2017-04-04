#!/bin/ash
ssh-keygen -A
/usr/sbin/sshd -D -e &
exec "$@"
