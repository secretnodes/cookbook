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
echo "Launch the enigma Secret Nodes CLI with this script."
wget -O eng-cli.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eng-cli.sh
sleep 1
echo "Start a previously stopped enigma worker with this script."
wget -O eng-start.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eng-start.sh
sleep 1
echo "Provision a host machine to run various different nodes with this script."
wget -O provision.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/provision.sh
sleep 1
echo "Create and launch a Kovan ETH Node with this script."
wget -O eth-kovan.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eth-kovan.sh
sleep 1
echo "Remove a Kovan ETH Node from your machine with this script."
wget -O eth-remove.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eth-remove.sh
sleep 1
echo "Stop your Kovan ETH Node with this script."
wget -O eth-stop.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eth-stop.sh
sleep 1
echo "Start a previously stopped Kovan ETH Node with this script."
wget -O eth-start.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eth-start.sh
sleep 1
echo "Create a worker for your Enigma Secret Node with this script."
wget -O eng-node.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eng-node.sh
sleep 1
echo "Manually stop your Enigma worker with this script."
wget -O eng-stop.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eng-stop.sh
sleep 1
echo "Remove all software provisioned to run nodes with this script."
wget -O deprovision.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/deprovision.sh
sleep 1
echo "Read the manual!"
wget -O readme.md https://raw.githubusercontent.com/secretnodes/cookbook/master/README.md
sleep 1

echo $(date -u) "Change permissions for scripts." 
sudo chmod u+x ~/eng-cli.sh
sudo chmod u+x ~/eng-start.sh
sudo chmod u+x ~/provision.sh
sudo chmod u+x ~/eth-kovan.sh
sudo chmod u+x ~/eth-remove.sh
sudo chmod u+x ~/eth-stop.sh
sudo chmod u+x ~/eth-start.sh
sudo chmod u+x ~/eng-node.sh
sudo chmod u+x ~/eng-stop.sh
sudo chmod u+x ~/deprovision.sh

echo "Complete!"
