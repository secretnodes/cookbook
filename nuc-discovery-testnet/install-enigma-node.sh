#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.30 NUC General | Dec 22, 2019
#Tested on : 8i7BEK, ...
# This is for the discovery testnet beta, NOTE THE NETWORK HAS NOT LAUNCHED.

echo "Downloading and installing enigma node software."
echo "Discovery Testnet Beta."
git clone https://github.com/enigmampc/discovery-testnet tmp/
cp -R discovery-testnet/ tmp/
sleep 2
