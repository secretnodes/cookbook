sudo docker pull parity/parity:v2.6.8-beta
sleep 2
echo $(date -u) "Launching Parity Eth Node. V2.6.8-beta" >> sendlogs.txt
sudo docker run -h eth --name eth -p 8546:8546 \
           -v ~/.parity-kovan:/home/parity/.local/share/io.parity.ethereum/ \
           -it parity/parity:v2.6.8-beta --chain=kovan \
           --ws-interface=all --ws-origins="all" \
           --base-path /home/parity/.local/share/io.parity.ethereum/
