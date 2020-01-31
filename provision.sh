#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Jan 31, 2020
#Tested on 8i7BEK & 8i3BEH
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo "Please report any issues you face at https://t.me/secretnodes"

echo $(date -u) "Implimenting fix for docker caused networking issue https://github.com/docker/libnetwork/issues/2187" 
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
echo $(date -u) "Note: To upgrade all scripts, you must merely run sendnodes.sh again."

sleep 4

#Forked from https://github.com/clcain/sgx-auto-install/

echo "- - - Installing packages - - - "
sudo apt-get install -y build-essential ocaml ocamlbuild automake autoconf libtool wget python libssl-dev
sudo apt-get install -y libssl-dev libcurl4-openssl-dev protobuf-compiler libprotobuf-dev debhelper cmake
echo

echo "- - - Cloning sgx-software-enable repository - - -"
cd ../
git clone https://github.com/intel/sgx-software-enable.git
cd sgx-software-enable/
echo

echo "- - - Making sgx-software-enable - - -"
make
echo

echo "- - - Running sgx-software-enable - - -"
sudo ./sgx_enable
echo

echo "- - - Checking SGX status - - -"
sudo ./sgx_enable --status
echo

echo "- - - Installing headers - - -"
sudo apt-get install -y linux-headers-$(uname -r)
echo

echo "- - - Cloning linux-sgx-driver repository - - -"
cd ../
git clone https://github.com/intel/linux-sgx-driver.git
cd linux-sgx-driver/
echo

echo "- - - Building SGX driver - - -"
sudo make
echo

echo "- - - Installing SGX driver - - -"
sudo mkdir -p "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx"
sudo cp isgx.ko "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx"
sudo sh -c "cat /etc/modules | grep -Fxq isgx || echo isgx >> /etc/modules"
sudo /sbin/depmod
sudo /sbin/modprobe isgx
echo

echo "SGX driver installation complete."

echo "- - - Cloning linux-sgx repository - - -"
cd ../
git clone https://github.com/intel/linux-sgx
cd linux-sgx/
git checkout sgx_2.7.1

echo "- - - Downloading binaries - - -"
./download_prebuilt.sh
echo

echo "- - - Compiling SGX SDK - - -"
make -j 4 sdk
echo

cd linux/installer/bin/

echo "- - - Building SGX SDK installer - - -"
./build-installpkg.sh sdk
echo

echo "- - - Running SGX SDK installer - - -"
echo yes | ./sgx_linux_x64_sdk_2.7.101.3.bin
if ! grep "source $PWD/sgxsdk/environment" ~/.bashrc
then
    echo "source $PWD/sgxsdk/environment" >> ~/.bashrc
fi
. ~/.bashrc
echo

cd ../../../

echo "SGX installation complete."
sleep 2

# Back to root directory test
cd ~

echo "Installing Docker & Docker Compose."
echo $(date -u) "===> Running step 1" >> sendlogs.txt
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sleep 2

echo $(date -u) "===> Running step 2" >> sendlogs.txt
sudo chmod +x /usr/local/bin/docker-compose

echo $(date -u) "===> Running Step 4" >> sendlogs.txt
sudo apt update

echo $(date -u) "===> install prerequisite packages which let apt use packages over HTTPS" >> sendlogs.txt
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sleep 2

echo $(date -u) "===> Add the GPG key for the official Docker repository to your system" >> sendlogs.txt
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sleep 2

echo $(date -u) "===> Add the Docker repository to APT sources" >> sendlogs.txt
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sleep 2

echo $(date -u) "===> update the package database with the Docker packages from the newly added repo" >> sendlogs.txt
sudo apt update
sudo apt upgrade

echo $(date -u) "===>  install from the Docker repo instead of the default Ubuntu repo" >> sendlogs.txt
apt-cache policy docker-ce

echo $(date -u) "===> Install Docker" >> sendlogs.txt
sudo apt install docker-ce

echo "===> Verify Docker Compose installation was successful."
echo "===> type : docker-compose --version"
echo $(date -u) "===> Docker should now be installed, the daemon started, and the process enabled to start on boot. Check that it’s running" >> sendlogs.txt
echo "===> type : sudo systemctl status docker"
sleep 3

echo $(date -u) "Downloading scripts from secretnodes.org"
wget -O eng-cli.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eng-cli.sh
sleep 2
wget -O eng-start.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eng-start.sh
sleep 2
wget -O upgrade.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/upgrade.sh
sleep 2
wget -O eth-kovan.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eth-kovan.sh
sleep 2
wget -O eth-remove.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eth-remove.sh
sleep 2
wget -O eth-stop.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eth-stop.sh
sleep 2
wget -O eth-start.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eth-start.sh
sleep 2
wget -O eth-start.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eng-node.sh
sleep 2
wget -O eth-start.sh https://raw.githubusercontent.com/secretnodes/scripts/canary/eng-stop.sh
sleep 2

echo $(date -u) "Change permissions for install sgx, install docker, start, & upgrade scripts." >> sendlogs.txt
sudo chmod u+x ~/eng-cli.sh
sleep 1
sudo chmod u+x ~/eng-start.sh
sleep 1
sudo chmod u+x ~/upgrade.sh
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

echo $(date -u) "Downloading and installing enigma node software."
git clone https://github.com/enigmampc/discovery-testnet
sleep 2
cd discovery-testnet
sleep 1
git pull origin master
sleep 2
cd ~
sleep 1

echo "Please report any issues you encounter by clicking New Issue on this page https://github.com/secretnodes/scripts/issues"
echo "<3 from https://secretnodes.org"
