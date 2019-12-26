#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.1 | Sep 22, 2019

echo "Update & Upgrade System."
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

echo "Updating all scripts for configuring your Secret Node."
wget -N install-docker.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-docker.sh
sleep 1
wget -N install-sgx.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-sgx.sh
sleep 1
wget -N install-enigma-node.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-enigma-node.sh
sleep 1
wget -N install-fixes.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-fixes.sh
sleep 1
wget -N update-discovery-testnet.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/update-discovery-testnet.sh
sleep 1
wget -N update-discovery-testnet.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/cli.sh
sleep 1
wget -N start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/start.sh
sleep 1

echo "Updating enigma testnet software."
bash update-discovery-testnet.sh


echo "Complete!"
