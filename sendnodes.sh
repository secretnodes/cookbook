#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.75 | Dec 27, 2019
#Tested on 8i7BEK
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo $(date -u) "Downloading scripts to configure your Secret Node." >> sendlogs.txt
wget -N clear-scripts.sh https://raw.githubusercontent.com/secretnodes/scripts/master/refresh-scripts.sh
sleep 1
wget -N install-docker.sh https://raw.githubusercontent.com/secretnodes/scripts/master/install-docker.sh
sleep 1
wget -N install-sgx.sh https://raw.githubusercontent.com/secretnodes/scripts/master/install-sgx.sh
sleep 1
wget -N start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/start.sh
sleep 1
wget -N install-enigma-node.sh https://raw.githubusercontent.com/secretnodes/scripts/master/install-enigma-node.sh
sleep 1
wget -N upgrade.sh https://raw.githubusercontent.com/secretnodes/scripts/master/upgrade.sh
sleep 1
wget -N install-fixes.sh https://raw.githubusercontent.com/secretnodes/scripts/master/install-fixes.sh
sleep 1
wget -N update-discovery-testnet.sh https://raw.githubusercontent.com/secretnodes/scripts/master/update-discovery-testnet.sh
sleep 1
wget -N update-discovery-testnet.sh https://raw.githubusercontent.com/secretnodes/scripts/master/cli.sh
#wget -O uninstall.sh https://raw.githubusercontent.com/secretnodes/scripts/master/uninstall.sh
#sleep 1

echo $(date -u) "Change permissions for install sgx, install docker, start, & upgrade scripts." >> sendlogs.txt
sudo chmod u+x ~/refresh-scripts.sh
sleep 1
sudo chmod u+x ~/install-sgx.sh
sleep 1
sudo chmod u+x ~/install-docker.sh
sleep 1
sudo chmod u+x ~/start.sh
sleep 1
sudo chmod u+x ~/upgrade.sh
sleep 1
sudo chmod u+x ~/install-enigma-node.sh
sleep 1
sudo chmod u+x ~/install-fixes.sh
sleep 1
sudo chmod u+x ~/update-discovery-testnet.sh
sleep 1
sudo chmod u+x ~/cli.sh
sleep 1
#sudo chmod u+x ~/uninstall.sh
#sleep 1

echo $(date -u) "Running upgrade.sh script." >> sendlogs.txt
sudo bash upgrade.sh
sleep 2
echo $(date -u) "The script is not finished yet. Next we will install docker, please wait." >> sendlogs.txt

echo $(date -u) "Running install-docker.sh script." >> sendlogs.txt
sudo bash install-docker.sh
sleep 2
echo $(date -u) "The script is not finished yet. Next we will install sgx, please wait." >> sendlogs.txt

echo $(date -u) "Running install-sgx.sh script." >> sendlogs.txt
sudo bash install-sgx.sh
sleep 2

echo $(date -u) "Running install-enigma-node.sh" >> sendlogs.txt
sudo bash install-enigma-node.sh
sleep 2

echo $(date -u) "Running install-fixes.sh" >> sendlogs.txt
sudo bash install-fixes.sh
sleep 2

echo $(date -u) "Applying fixes." >> sendlogs.txt
sudo bash install-fixes.sh
sleep 2

echo $(date -u) "<3 from https://secretnodes.org" >> sendlogs.txt
