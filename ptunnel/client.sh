#! /bin/sh
ptunnel -p $IP -lp $MIDDLE_PORT -da 127.0.0.1 -dp $SSH_PORT -x $PASSWORD
