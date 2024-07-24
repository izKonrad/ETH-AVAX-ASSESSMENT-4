# ETH+AVAX Assessment 4 || DegenToken

## Overview

DegenToken is an ERC20-compliant token with additional features such as minting, burning, and redeeming tokens for NFT accessories. This smart contract is written in Solidity and designed to run on the Ethereum blockchain.

## Features
- ERC20 compliant token
- Minting by the contract owner
- Transferring tokens: Players should be able to transfer their tokens to others.
- Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
- Checking token balance: Players should be able to check their token balance at any time.
- Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

## Getting Started

### Functionalities

1. 'mint' function (only owner) to mint new DGN tokens.

2. 'burn' Allows users to burn a specified amount of DGN tokens from their own balance.

3. 'getBalance' Returns the balance of DGN tokens for the caller's address.
 
4. 'transferto' Allows users to transfer a specified amount of DGN tokens to another address.

5. 'redeemToken' This function enables users to redeem DGN tokens for in-game weapons. Here's how it works:
The user invokes the redeemTokens function, specifying the weapon they wish to redeem (e.g., TwoHandedSword, Spear, etc.). The contract then verifies if the user possesses enough DGN tokens to cover the weapon's cost, as listed in the itemPrices mapping. If the user has sufficient tokens, the contract increases the user's inventory for the chosen weapon and burns the necessary amount of tokens from the user's balance. A message is logged to indicate the successful redemption, detailing the weapon name and the number of tokens redeemed.

## Redeem Process
The redeem process follows these steps:

1. The user calls redeemTokens with the desired weapon type.
2. The contract checks the user's balance and the weapon's price.
3. If the user has enough tokens, the contract updates the user's inventory and burns the required tokens.
4. The contract logs a success message.

### Executing program

(1) Open Remix:
Remix.

(2) Create a New File:

  - In the left sidebar, click on the "+" icon to create a new file.
  - Name it DegenToken.sol.

(3) Copy and paste the code from DegenToken1.sol file into your file:

(4) To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to latest solidity version (or another compatible version), and then click on the "Compile" button.

(5) After the code is compiled, go to the "Deploy & run transactions" tab and select injected provider as the environment and connect your Metamask account with the test AVAX.

(6) Select the your contract from the dropdown menu, and then click on the "Deploy" button.

(7) After deploying, you can interact with the contract directly from Remix:

  - Mint Tokens: Call the mint function with the recipient's address and the amount of tokens.
  - Check Balance: Call the balanceOf function with an address to check its token balance.
  - Transfer Tokens: Call the transfer function with the recipient's address and the amount of tokens.
  - Burn Tokens: Call the burn function with the amount of tokens to be burned.
  - Redeem Tokens: Call the redeem function with the NFT accessory ID to redeem tokens for an accessory.
## Author

- Konrad Orata
  - GitHub: (https://github.com/izKonrad)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details.

---
