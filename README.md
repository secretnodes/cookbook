# scripts
These scripts are meant to empower node runners. More information will be added as time goes on.

# Provision your machine with software needed to run Enigma Secret Nodes & Ethereum Nodes.

1. Download our node provision script.
```bash
wget https://raw.githubusercontent.com/secretnodes/scripts/canary/provision.sh
```

2. Run the secretnodes.org provision script. Be sure to respond with "y" or "yes" to all inquiries.
```bash
sudo bash provision.sh
```
3. Run the following command:
```bash
sudo gpasswd -a $USER docker
```

4. Run the following command:
```bash
newgrp docker
```

5. Run the following command:
```bash
docker ps
```

If the command returns a permission error, then reboot your machine and try again from step 3.

# Prepare your Ethereum Kovan Full Node

To prepare your ETH Kovan Full node, a prerequisite needed to run a Secret Node, follow these steps.

1. Run the following command:
```bash
bash eth-kovan.sh
```
2. Run the following command:
```bash
bash eth-start.sh
```
