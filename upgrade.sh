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

echo $(date -u) "Downloading scripts to configure your Secret Node." >> sendlogs.txt
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

echo $(date -u) "Updating enigma testnet software." >> sendlogs.txt
bash update-discovery-testnet.sh >> sendlogs.txt


echo "Complete!"
