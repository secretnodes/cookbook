#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.15 | Sep 22, 2019

echo "Downloading scripts to configure your Secret Node."
wget -O "https://raw.githubusercontent.com/secretnodes/scripts/master/install-docker.sh"
sleep 1
wget -O "https://raw.githubusercontent.com/secretnodes/scripts/master/install-sgx.sh"
sleep 1

echo "Downloading Discovery-Docker-Network."
git -O clone https://github.com/enigmampc/discovery-docker-network.git
sleep 1

echo "<3 from https://secretnodes.org"
