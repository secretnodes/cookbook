#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.12 | Dec 26, 2019

echo $(date -u) "===> Running step 1" >> sendlogs.txt
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose

echo $(date -u) "===> Running step 2" >> sendlogs.txt
sudo chmod +x /usr/local/bin/docker-compose

echo $(date -u) "===> Running Step 4" >> sendlogs.txt
sudo apt update

echo $(date -u) "===> install prerequisite packages which let apt use packages over HTTPS" >> sendlogs.txt
sudo apt install apt-transport-https ca-certificates curl software-properties-common

echo $(date -u) "===> Add the GPG key for the official Docker repository to your system" >> sendlogs.txt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo $(date -u) "===> Add the Docker repository to APT sources" >> sendlogs.txt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"

echo $(date -u) "===> update the package database with the Docker packages from the newly added repo" >> sendlogs.txt
sudo apt update >> sendlogs.txt
sudo apt upgrade >> sendlogs.txt

echo $(date -u) "===>  install from the Docker repo instead of the default Ubuntu repo" >> sendlogs.txt
apt-cache policy docker-ce >> sendlogs.txt

echo $(date -u) "===> Install Docker" >> sendlogs.txt
sudo apt install docker-ce >> sendlogs.txt

echo "===> Verify Docker Compose installation was successful."
echo "===> type : docker-compose --version"
echo $(date -u) "===> Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running" >> sendlogs.txt
echo "===> type : sudo systemctl status docker"
echo "<3 from https://secretnodes.org"
