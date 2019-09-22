#!/bin/bash
#Tested on ubuntu server 18.04
#Version 0.1

echo "To install the Intel® SGX PSW, first install the following tools: On Ubuntu* 18.04:"
sudo apt-get install libssl-dev libcurl4-openssl-dev libprotobuf-dev

echo "To install the Intel® SGX SDK, install the following: On Ubuntu* 18.04:"
sudo apt-get install build-essential python

echo "===> Downloading Intel SGX Driver Files."
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common-dev_2.6.100.51363-bionic1_amd64.deb"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common-dbgsym_2.6.100.51363-bionic1_amd64.ddeb"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/libsgx-enclave-common_2.6.100.51363-bionic1_amd64.deb"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/sgx_linux_x64_driver_2.5.0_2605efa.bin"
wget "https://download.01.org/intel-sgx/linux-2.6/ubuntu18.04-server/sgx_linux_x64_sdk_2.6.100.51363.bin"

echo "===> Change permissions for sgx driver bin."
chmod +x ./sgx_linux_x64_driver_2.5.0_2605efa.bin
chmod +x sgx_linux_x64_sdk_2.6.100.51363.bin

echo "Install the Intel® SGX driver package"
sudo ./sgx_linux_x64_driver_2.5.0_2605efa.bin

echo "Install the Intel® SGX PSW package using the following command: on Ubuntu* 18.04:"
sudo dpkg -i ./libsgx-enclave-common_2.6.100.51363-bionic1_amd64.deb
sudo dpkg -i libsgx-enclave-common-dev_2.6.100.51363-bionic1_amd64.deb

echo "Installing sgx sdk."
sudo ./sgx_linux_x64_driver_2.5.0_2605efa.bin

echo "===> Installed SGX on Linux."
echo "Setting LD LIBRARY PATH"
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
