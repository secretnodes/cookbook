#!/bin/bash
#Configured for ubuntu server 18.04
#Tested on : 8i7BEK, ...
# This is for the discovery testnet beta, NOTE THE NETWORK HAS NOT LAUNCHED.
# V0.12 | Dec 26, 2019

echo $(date -u) "Updating enigma node software." >> sendlogs.txt
echo "Discovery Testnet Beta."
docker pull enigmampc/external_worker_hw:testnet >> sendlogs.txt
sleep 1
