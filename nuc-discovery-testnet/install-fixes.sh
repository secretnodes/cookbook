#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.2 NUC General | Sep 26, 2019
#Tested on : 8i7BEK, ...

echo "Please report any issues you face at https://t.me/secretnodes"

echo "Implimenting fix for docker caused networking issue https://github.com/docker/libnetwork/issues/2187"
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
echo "Note: To upgrade all scripts, you must merely run sendnodes.sh again."