#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.15 | Dec 26, 2019

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
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-docker.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-sgx.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-enigma-node.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-fixes.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/update-discovery-testnet.sh
sleep 1
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/cli.sh
sleep 1

echo $(date -u) "Updating enigma testnet software." >> sendlogs.txt
bash update-discovery-testnet.sh >> sendlogs.txt


echo "Complete!"
