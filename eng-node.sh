#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Jan 31, 2020
#Tested on 8i7BEK & 8i3BEH
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo "Please report any issues you encounter by clicking New Issue on this page https://github.com/secretnodes/cookbook/issues"

echo $(date -u) "Downloading and installing enigma node software."
git clone https://github.com/enigmampc/discovery-testnet
sleep 2
cd discovery-testnet
sleep 1
git pull origin master
sleep 2

echo "<3 from https://secretnodes.org"
