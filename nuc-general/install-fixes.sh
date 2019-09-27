#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.2 NUC General | Sep 26, 2019
#Tested on : 8i7BEK, ...

echo "Created nuc-1.fix"
echo "This is currently an experimental fix for issue Get https://registry-1.docker.io/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)"
echo "It creates a file with new nameservers to symlink to /etc/resolv.conf"
echo "Please report any issues you face at https://t.me/secretnodes"

Cat "nameserver 1.1.1.1
nameserver 8.8.8.8
nameserver 127.0.0.53
options edns0t" | tee nuc-1.fix

echo "Creating symlink via: Ls -s /etc/resolv.conf nuc-1.fix"
Ls -s /etc/resolv.conf nuc-1.fix

echo "Note: To upgrade all scripts, you must merely run sendnodes.sh again."
