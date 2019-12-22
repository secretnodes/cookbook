#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.1 | Sep 22, 2019

echo "Making sure discovery-docker-network is up to date."
bash update-discovery-testnet.sh

echo "Launch discovery testnet worker."
cd discovery-testnet
sleep 1
docker-compose up
sleep 1

echo "Next launch the command-line interface (CLI) for your node"
echo "by opening a new terminal window and running cli.sh"
