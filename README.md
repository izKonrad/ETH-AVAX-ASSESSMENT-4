# ETH+AVAX Assessment 4 || DegenToken

## Overview

DegenToken is an ERC20-compliant token with additional features such as minting, burning, and redeeming tokens for NFT accessories. This smart contract is written in Solidity and designed to run on the Ethereum blockchain.

## Features
- ERC20 compliant token
- Minting by the contract owner
- Minting new tokens: The platform should be able to create new tokens and distribute them to players as rewards. Only the owner can mint tokens.
- Transferring tokens: Players should be able to transfer their tokens to others.
- Redeeming tokens: Players should be able to redeem their tokens for items in the in-game store.
- Checking token balance: Players should be able to check their token balance at any time.
- Burning tokens: Anyone should be able to burn tokens, that they own, that are no longer needed.

## Getting Started

### Functionalities

1. 'mint' function (only owner) to mint new DGN tokens.

2. 'burn' function to burn DEGEN tokens.

3. 'balanceOf' function to check the token balance of a specific address.

4. 'transfer' function to send DEGEN tokens from your address to another address.

5. 'approve' function to allow another address to spend a specific amount of DEGEN tokens on your behalf.

6. 'transferFrom' function to transfer DEGEN tokens on behalf of another address.

7. 'getRedeemedItem' function to check what item you redeeemed.

8. 'redeemWeapon' function to redeem DEGEN tokens for NFTs.

9. 'symbol' you can get the abbreviation of the token's name.

10. 'name' you can know the name of the token.

11. 'totalSupply' you can know the total amount of tokens present.

12. 'decimals' you can know the total amount of decimal places present.

13. 'owner' you can know the address of the owner.

### Executing program

(1) Open Remix:

    Go to Remix.

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
