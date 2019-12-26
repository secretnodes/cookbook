#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.32 NUC General | Dec 26, 2019
#Tested on : 8i7BEK, ...
# This is for the discovery testnet beta, NOTE THE NETWORK HAS NOT LAUNCHED.

echo $(date -u) "Downloading and installing enigma node software." >> sendlogs.txt
echo $(date -u) "Discovery Testnet Beta." >> sendlogs.txt
git clone https://github.com/enigmampc/discovery-testnet tmp/
cp -R discovery-testnet/ tmp/
sleep 2
