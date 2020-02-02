#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Jan 31, 2020
#Tested on 8i7BEK & 8i3BEH
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo "Please report any issues you face at https://t.me/secretnodes"

echo $(date -u) "Uninstalling SGX Drivers #Forked from https://github.com/clcain/sgx-auto-install/" 

cd ../linux-sgx-driver/

echo "- - - Uninstalling SGX driver - - -"
sudo /sbin/modprobe -r isgx
sudo rm -rf "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx"
sudo /sbin/depmod
sudo /bin/sed -i '/^isgx$/d' /etc/modules
echo

echo "- - - Removing linux-sgx-driver repository - - -"
cd ../
sudo rm -rf linux-sgx-driver/
echo

echo "SGX driver uninstalled."

echo "- - - Uninstalling SGX PSW - - -"
sudo /opt/intel/sgxpsw/uninstall.sh
echo

echo "- - - Uninstalling SGX SDK - - -"
../linux-sgx/linux/installer/bin/sgxsdk/uninstall.sh
echo

echo "- - - Removing linux-sgx repository - - -"
rm -rf ../linux-sgx
echo

echo "SGX Uninstall complete."
sleep 2

echo "Uninstalling Docker & Docker Compose."
sudo apt-get purge docker-ce
sudo rm -rf /var/lib/docker
echo "===> Docker-CE uninstalled successfully."

sleep 2


echo "Please report any issues you encounter by clicking New Issue on this page https://github.com/secretnodes/soup/issues"
echo "<3 from https://secretnodes.org"

