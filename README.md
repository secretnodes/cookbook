# scripts
These scripts are meant to empower node runners. More information will be added as time goes on.


# Prepare your Ethereum Kovan Full Node

To prepare your ETH Kovan Full node, a prerequisite needed to run a Secret Node, follow these steps.

1. Run the following command:
```bash
wget https://raw.githubusercontent.com/secretnodes/scripts/canary/eth-kovan.sh
```
2. Run the following command:
```bash
bash eth-kovan.sh
```
3. Run the following command:
```bash
wget https://raw.githubusercontent.com/secretnodes/scripts/canary/eth-start.sh
```
4. Run the following command:
```bash
bash eth-start.sh
```

If you do not already have Docker & Docker Compose installed, then do this.

1. Download our node provision script.
```bash
wget https://raw.githubusercontent.com/secretnodes/scripts/canary/provision.sh
```

2. Run the secretnodes.org provision script.
```bash
sudo bash provision.sh
```
3. Go back and start at step 1 in the "Prepare your Ethereum Kovan Full Node" Guide above.
