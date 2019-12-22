#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.2 NUC General | Sep 26, 2019
#Tested on : 8i7BEK, ...

echo "Downloading scripts to configure your Secret Node."
wget -O install-docker.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/install-docker.sh
sleep 1
wget -O install-sgx.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/install-sgx.sh
sleep 1
wget -O start.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/start.sh
sleep 1
wget -O install-enigma-node.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/install-enigma-node.sh
sleep 1
wget -O upgrade.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/upgrade.sh
sleep 1
wget -O install-fixes.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/install-fixes.sh
sleep 1
wget -O uninstall.sh https://raw.githubusercontent.com/secretnodes/scripts/master/nuc-general/uninstall.sh
sleep 1

echo "Change permissions for install sgx, install docker, start, & upgrade scripts."
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
#sudo chmod u+x ~/uninstall.sh
#sleep 1

echo "Running upgrade.sh script."
sudo bash upgrade.sh
sleep 2
echo "The script is not finished yet. Next we will install docker, please wait."

echo "Running install-docker.sh script."
sudo bash install-docker.sh
sleep 2
echo "The script is not finished yet. Next we will install sgx, please wait."

echo "Running install-sgx.sh script."
sudo bash install-sgx.sh
sleep 2

echo "Running install-enigma-node.sh"
sudo bash install-enigma-node.sh
sleep 2

echo "Running install-fixes.sh"
sudo bash install-fixes.sh
sleep 2

echo "Applying fixes."
sudo bash install-fixes.sh
sleep 2

echo "<3 from https://secretnodes.org"
