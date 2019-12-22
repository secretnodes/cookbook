#!/bin/bash
#Configured for ubuntu server 18.04
#Tested on : 8i7BEK, ...
# This is for the discovery testnet beta, NOTE THE NETWORK HAS NOT LAUNCHED.

echo "Launching Discovery Testnet Beta CLI"
cd discovery-testnet
sleep 1
docker exec -it worker cli
