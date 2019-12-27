#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.75 | Dec 27, 2019
#Tested on 8i7BEK
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo $(date -u) "Update & Upgrade System."
sudo apt-get update
sleep 2
sudo apt-get -y dist-upgrade
sleep 2
sudo apt-get -y autoremove
sleep 2
sudo apt-get clean
sleep 2
sudo apt-get autoclean
sleep 2

echo $(date -u) "Updating all scripts for configuring your Secret Node." >> sendlogs.txt
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/install-docker.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/install-sgx.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/install-enigma-node.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/install-fixes.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/update-discovery-testnet.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/cli.sh
sleep 1

echo $(date -u) "Updating enigma testnet software." >> sendlogs.txt
bash update-discovery-testnet.sh >> sendlogs.txt


echo "Complete!"
