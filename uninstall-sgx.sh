#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.75 | Dec 27, 2019
#Tested on 8i7BEK
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo $(date -u) "Uninstalling the SGX Driver." >> sendlogs.txt
bash sudo /sbin/modprobe -r isgx
bash sudo rm -rf "/lib/modules/"`uname -r`"/kernel/drivers/intel/sgx"
bash sudo /sbin/depmod
bash sudo /bin/sed -i '/^isgx$/d' /etc/modules

echo $(date -u) "The SGX Driver should now be successfully removed." >> sendlogs.txt
echo "<3 from https://secretnodes.org"