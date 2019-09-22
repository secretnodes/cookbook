#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.16 | Sep 22, 2019

echo "Downloading scripts to configure your Secret Node."
wget -O install-docker.sh https://raw.githubusercontent.com/secretnodes/scripts/master/install-docker.sh
wget -O install-sgx.sh https://raw.githubusercontent.com/secretnodes/scripts/master/install-sgx.sh
wget -O start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/start.sh
wget -O upgrade.sh https://raw.githubusercontent.com/secretnodes/scripts/master/upgrade.sh

echo "Downloading Discovery-Docker-Network."
git clone https://github.com/enigmampc/discovery-docker-network.git
sleep 2

echo "Change permissions for install sgx, install docker, start, & upgrade scripts."
chmod u+x ~/install-sgx.sh
chmod u+x ~/install-docker.sh
chmod u+x ~/start.sh
chmod u+x ~/upgrade.sh

echo "<3 from https://secretnodes.org"
