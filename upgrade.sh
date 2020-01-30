#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Dec 27, 2019
#Tested on 8i7BEK & 8i3BEH
#Should work for SGX compatible intel NUCs, Vultr Bare Metal.
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


echo $(date -u) "Updating enigma testnet software." >> sendlogs.txt
sudo docker pull enigmampc/external_worker_hw:testnet
sleep 1
sudo docker pull parity/parity:stable

echo $(date -u) "Downloading scripts from secretnodes.org" >> sendlogs.txt
wget -O eng-cli.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eng-cli.sh
sleep 2
wget -O eng-start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eng-start.sh
sleep 2
wget -O eth-console.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eth-console.sh
sleep 2
wget -O eth-create.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eth-create.sh
sleep 2
wget -O eth-logs.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eth-logs.sh
sleep 2
wget -O eth-remove.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eth-remove.sh
sleep 2
wget -O eth-start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eth-start.sh
sleep 2
wget -O eth-stop.sh https://raw.githubusercontent.com/secretnodes/scripts/master/eth-stop.sh

echo $(date -u) "Change permissions for install sgx, install docker, start, & upgrade scripts." >> sendlogs.txt
sudo chmod u+x ~/eng-cli.sh
sleep 1
sudo chmod u+x ~/eng-start.sh
sleep 1
sudo chmod u+x ~/eth-console.sh
sleep 1
sudo chmod u+x ~/eth-create.sh
sleep 1
sudo chmod u+x ~/eth-logs.sh
sleep 1
sudo chmod u+x ~/eth-remove.sh
sleep 1
sudo chmod u+x ~/eth-start.sh
sleep 1
sudo chmod u+x ~/eth-stop.sh
sleep 1

echo "Complete!"
