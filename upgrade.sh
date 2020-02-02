#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Jan 31, 2020
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


echo $(date -u) "Updating enigma testnet software." 
sudo docker pull enigmampc/external_worker_hw:testnet
sleep 1
sudo docker pull parity/parity:stable

echo $(date -u) "Downloading scripts from secretnodes.org"
wget -O eng-cli.sh https://raw.githubusercontent.com/secretnodes/soup/master/eng-cli.sh
sleep 2
wget -O eng-start.sh https://raw.githubusercontent.com/secretnodes/soup/master/eng-start.sh
sleep 2
wget -O provision.sh https://raw.githubusercontent.com/secretnodes/soup/master/provision.sh
sleep 2
wget -O eth-kovan.sh https://raw.githubusercontent.com/secretnodes/soup/master/eth-kovan.sh
sleep 2
wget -O eth-remove.sh https://raw.githubusercontent.com/secretnodes/soup/master/eth-remove.sh
sleep 2
wget -O eth-stop.sh https://raw.githubusercontent.com/secretnodes/soup/master/eth-stop.sh
sleep 2
wget -O eth-start.sh https://raw.githubusercontent.com/secretnodes/soup/master/eth-start.sh
sleep 2
wget -O eng-node.sh https://raw.githubusercontent.com/secretnodes/soup/master/eng-node.sh
sleep 2
wget -O eng-stop.sh https://raw.githubusercontent.com/secretnodes/soup/master/eng-stop.sh
sleep 2
wget -O readme.md https://raw.githubusercontent.com/secretnodes/soup/master/README.md
sleep 2
wget -O deprovsion.sh https://raw.githubusercontent.com/secretnodes/soup/master/deprovision.sh
sleep 2

echo $(date -u) "Change permissions for install sgx, install docker, start, & upgrade scripts." 
sudo chmod u+x ~/eng-cli.sh
sleep 1
sudo chmod u+x ~/eng-start.sh
sleep 1
sudo chmod u+x ~/provison.sh
sleep 1
sudo chmod u+x ~/eth-kovan.sh
sleep 1
sudo chmod u+x ~/eth-remove.sh
sleep 1
sudo chmod u+x ~/eth-stop.sh
sleep 1
sudo chmod u+x ~/eth-start.sh
sleep 1
sudo chmod u+x ~/eng-node.sh
sleep 1
sudo chmod u+x ~/eng-stop.sh
sleep 1
sudo chmod u+x ~/deprovision.sh
sleep 1

echo "Complete!"
