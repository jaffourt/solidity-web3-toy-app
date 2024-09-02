# solidity-web3-toy-app

For Abril's abuela 💙

## Guide

### Create the app using `truffle` and `ganache`

1. install Truffle Suite: `npm install -g truffle`
2. install Ganache a local blockchain simulator: `npm install -g ganache`
3. `truffle init`

### Compile solidity code
1. `truffle compile`

### Deploy the app
1. Deploy the blockchain network: `ganache`

In a new process:

2. Migrate binaries to the network: `truffle migrate`
3. Interact: `truffle console`


### Use the app!

In the truffle console run:

```
ConwaysLife = artifacts.require("ConwaysLife")
conwaysLifeInstance = await ConwaysLife.deployed()
```

### Transaction costs
```
1_deploy_conways_life.js
========================

   Deploying 'ConwaysLife'
   -----------------------
   > transaction hash:    0x5f3a157ccd4a9b69c27a6ced95b63ab55fe991b394ae09a9602ea7fa6612cad0
   > Blocks: 0            Seconds: 0
   > contract address:    0xD2F2abeA489cCE86BB3145bE7c2A02CF7Fb61a7b
   > block number:        1
   > block timestamp:     1725319528
   > account:             0xD1B56eB6A25A21C617d3aEd9aDD9EF98b6F280eC
   > balance:             999.997374088
   > gas used:            778048 (0xbdf40)
   > gas price:           3.375 gwei
   > value sent:          0 ETH
   > total cost:          0.002625912 ETH

   > Saving artifacts
   -------------------------------------
   > Total cost:         0.002625912 ETH

Summary
=======
> Total deployments:   1
> Final cost:          0.002625912 ETH
```
