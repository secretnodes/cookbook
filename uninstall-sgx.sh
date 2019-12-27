#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.75 | Dec 27, 2019
#Tested on 8i7BEK
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo $(date -u) "Uninstalling the SGX Driver." >> sendlogs.txt
sudo service aesmd stop
sudo /sbin/modprobe -r isgx
sudo rm -rf "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx"
sudo /sbin/depmod
sudo /bin/sed -i '/^isgx$/d' /etc/modules
sudo rm -rf isgx
rm libsgx-enclave-common-dev_2.7.101.3-bionic1_amd64.deb
rm libsgx-enclave-common_2.7.101.3-bionic1_amd64.deb
rm sgx_linux_x64_driver_2.6.0_4f5bb63.bin
rm sgx_linux_x64_sdk_2.7.101.3.bin

echo $(date -u) "The SGX Driver should now be successfully removed." >> sendlogs.txt
echo "<3 from https://secretnodes.org"
