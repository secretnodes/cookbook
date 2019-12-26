#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.16 | Dec 26, 2019

echo $(date -u) "Checking for updates then running upgrade script." >> sendlogs.txt
wget -N https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-discovery-testnet/upgrade.sh
sleep 1
bash upgrade.sh
sleep 1

echo $(date -u) "Launch discovery testnet worker." >> sendlogs.txt
cd discovery-testnet
sleep 1
docker-compose up
sleep 1

echo $(date -u) "Next launch the command-line interface (CLI) for your node" >> sendlogs.txt
echo "by opening a new terminal window and running cli.sh"
