#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.1 | Sep 22, 2019

echo "Updating all scripts for configuring your Secret Node."
wget -O install-docker.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-docker.sh
sleep 1
wget -O install-sgx.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-sgx.sh
sleep 1
wget -O start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/start.sh
sleep 1
wget -O install-enigma-node.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-enigma-node.sh
sleep 1
wget -O upgrade.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/upgrade.sh
sleep 1
wget -O install-fixes.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/install-fixes.sh
sleep 1
wget -O update-discovery-testnet.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/update-discovery-testnet.sh
sleep 1
wget -O update-discovery-testnet.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/cli.sh

echo "Making sure discovery-docker-network is up to date."
bash update-discovery-testnet.sh

echo "Launch discovery testnet worker."
cd discovery-testnet
sleep 1
docker-compose up
sleep 1

echo "Next launch the command-line interface (CLI) for your node"
echo "by opening a new terminal window and running cli.sh"
