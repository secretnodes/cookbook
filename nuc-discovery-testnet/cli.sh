#!/bin/bash
#Configured for ubuntu server 18.04
#Tested on : 8i7BEK, ...
# This is for the discovery testnet beta, NOTE THE NETWORK HAS NOT LAUNCHED.
#Version 0.152 | Dec 26, 2019

echo $(date -u) "Updating start.sh script" >> sendlogs.txt
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/start.sh
sleep 1

echo $(date -u) "Launching Discovery Testnet Beta CLI" >> sendlogs.txt
cd discovery-testnet
sleep 1
docker exec -it worker cli
