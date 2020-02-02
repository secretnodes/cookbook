#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Jan 31, 2020
#Tested on 8i7BEK & 8i3BEH
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo "Please report any issues you face at https://t.me/secretnodes"

echo $(date -u) "Implimenting fix for docker caused networking issue https://github.com/docker/libnetwork/issues/2187" 
ln -sf /run/systemd/resolve/resolv.conf /etc/resolv.conf
echo $(date -u) "Note: To upgrade all scripts, you must merely run upgrade.sh."

sleep 1

echo $(date -u) "Installing SGX Drivers #Forked from https://github.com/clcain/sgx-auto-install/" 

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
sleep 1

# Back to root directory test
cd ~

echo "Installing Docker & Docker Compose."
echo $(date -u) "===> Running step 1" 
sudo curl -L https://github.com/docker/compose/releases/download/1.25.0-rc2/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sleep 1

echo $(date -u) "===> Running step 2" 
sudo chmod +x /usr/local/bin/docker-compose

echo $(date -u) "===> Running Step 4" 
sudo apt update

echo $(date -u) "===> install prerequisite packages which let apt use packages over HTTPS" 
sudo apt install apt-transport-https ca-certificates curl software-properties-common
sleep 1

echo $(date -u) "===> Add the GPG key for the official Docker repository to your system" 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sleep 1

echo $(date -u) "===> Add the Docker repository to APT sources" 
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic stable"
sleep 1

echo $(date -u) "===> update the package database with the Docker packages from the newly added repo" 
sudo apt update
sudo apt upgrade

echo $(date -u) "===>  install from the Docker repo instead of the default Ubuntu repo" 
apt-cache policy docker-ce

echo $(date -u) "===> Install Docker" 
sudo apt install docker-ce

echo "===> Verify Docker Compose installation was successful."
sleep 1

echo $(date -u) "Downloading scripts from secretnodes.org"
echo "Launch the enigma Secret Nodes CLI with this script."
wget -O eng-cli.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eng-cli.sh
sleep 1
echo "Start a previously stopped enigma worker with this script."
wget -O eng-start.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/eng-start.sh
sleep 1
echo "Upgrade all your scripts to the latest version with this script."
wget -O upgrade.sh https://raw.githubusercontent.com/secretnodes/cookbook/master/upgrade.sh
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
sudo chmod u+x ~/upgrade.sh
sudo chmod u+x ~/eth-kovan.sh
sudo chmod u+x ~/eth-remove.sh
sudo chmod u+x ~/eth-stop.sh
sudo chmod u+x ~/eth-start.sh
sudo chmod u+x ~/eng-node.sh
sudo chmod u+x ~/eng-stop.sh
sudo chmod u+x ~/deprovision.sh

echo "Please report any issues you encounter by clicking New Issue on this page https://github.com/secretnodes/cookbook/issues"
echo "<3 from https://secretnodes.org"

