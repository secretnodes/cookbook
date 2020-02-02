#!/bin/bash
#Configured for ubuntu server 18.04
#Version 0.9 | Jan 31, 2020
#Tested on 8i7BEK & 8i3BEH
#Should work for SGX compatible intel NUCs, Vultr Bare Metal.
#Confirmed working on enigma.co testnet

docker pull ethereum/client-go:latest
sleep 2

mkdir ~/.geth
sleep 1

docker run --name ethmainnet -p 8546:8546 \
           -v ~/.parity:/home/parity/.local/share/io.parity.ethereum/ \
           -it parity/parity:stable --ws-interface=all --ws-origins="all" \
           --base-path /home/parity/.local/share/io.parity.ethereum/