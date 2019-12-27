#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.75 | Dec 27, 2019
#Tested on 8i7BEK
#Should work for SGX compatible intel NUCs, Vultr Bare Metal, (more to come)
#Confirmed working on enigma.co testnet

echo "apt-get dpkg & update"
sudo apt-get update
sleep 5
sudo apt install dpkg

echo $(date -u) "To install the Intel® SGX PSW, first install the following tools" >> sendlogs.txt
sudo apt-get install libssl-dev libcurl4-openssl-dev libprotobuf-dev

echo $(date -u) "To install the Intel® SGX SDK, install the following:" >> sendlogs.txt
sudo apt-get install build-essential python

echo $(date -u) "Downloading the required SGX files." >> sendlogs.txt
curl -O "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common-dev_2.6.100.51363-bionic1_amd64.deb"
sleep 2
curl -O "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common_2.6.100.51363-bionic1_amd64.deb"
sleep 2
curl -O "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/sgx_linux_x64_driver_2.5.0_2605efa.bin"
sleep 2
curl -O "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/sgx_linux_x64_sdk_2.6.100.51363.bin"

echo $(date -u) "Setting permissions for driver & SDK." >> sendlogs.txt
chmod +x ./sgx_linux_x64_driver_2.5.0_2605efa.bin
sleep 2
chmod +x ./sgx_linux_x64_sdk_2.6.100.51363.bin
sleep 1

echo $(date -u) "Installing SGX driver." >> sendlogs.txt
sudo ./sgx_linux_x64_driver_2.5.0_2605efa.bin
sleep 4

echo $(date -u) "Installing psw" >> sendlogs.txt
sudo dpkg -i ./libsgx-enclave-common_2.6.100.51363-bionic1_amd64.deb
sleep 2
sudo dpkg -i ./libsgx-enclave-common-dev_2.6.100.51363-bionic1_amd64.deb
sleep 1

echo $(date -u) "Installing SGX on Linux. Chose to install SGX in current directory, respond with 'no'." >> sendlogs.txt
sudo ./sgx_linux_x64_sdk_2.6.100.51363.bin
sleep 2

echo $(date -u) "Setting LD LIBRARY PATH" >> sendlogs.txt
echo "<3 from https://secretnodes.org"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
