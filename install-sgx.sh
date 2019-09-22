#!/bin/bash
#Tested on ubuntu server 18.04
#Version 0.1

echo "===> Running step 1"
sudo apt-get install libssl-dev libcurl4-openssl-dev libprotobuf-dev

echo "===> Running step 2"
sudo apt-get install build-essential python

echo "===> Running step 3"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common-dev_2.6.100.51363-bionic1_amd64.deb"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common_2.6.100.51363-bionic1_amd64.deb"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/sgx_linux_x64_driver_2.5.0_2605efa.bin"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/sgx_linux_x64_sdk_2.6.100.51363.bin"

echo "===> Running step 4"
chmod +x ./sgx_linux_x64_driver_2.5.0_2605efa.bin
chmod +x ./sgx_linux_x64_sdk_2.6.100.51363.bin

echo "===> Running step 5 - installing driver"
sudo ./sgx_linux_x64_driver_2.5.0_2605efa.bin

echo "===> Running step 6 - installing psw"
sudo dpkg -i ./libsgx-enclave-common_2.6.100.51363-bionic1_amd64.deb
sudo dpkg -i libsgx-enclave-common-dev_2.6.100.51363-bionic1_amd64.deb

echo "===> Running step 7 - installing sdk"
sudo ./sgx_linux_x64_sdk_2.6.100.51363.bin

echo "===> Installed SGX on Linux. Chose to install SGX in the 'isgx' directory. So answer 'no' then type 'isgx' without quotes."
echo "Setting LD LIBRARY PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
