# AbubakarSNFT

AbubakarSNFT is a custom ERC721 NFT smart contract built on the Ethereum blockchain, utilizing OpenZeppelin Contracts for enhanced security and functionality. This contract allows both public and VIP minting, with the flexibility to update minting states, supply limits, and prices.

## Features

- **ERC721 Standard**: The contract follows the ERC721 standard, ensuring that it is compatible with existing NFT infrastructure and marketplaces.
- **Enumerable**: The contract inherits from ERC721Enumerable, enabling the enumeration of NFTs, which allows for counting and listing all tokens.
- **Pausable**: The contract can pause and unpause minting operations, providing control over the minting process.
- **Ownable**: The contract includes ownership management, where certain functions are restricted to the owner of the contract.
- **VIP Minting**: Special provisions are made for VIP users who can mint NFTs at a discounted price and with exclusive access.

## Contract Details

### Key Variables

- **_nextTokenId**: Internal counter for tracking the next token ID to be minted.
- **maxSupply**: The maximum number of NFTs that can be minted.
- **publicPrice**: The price for minting NFTs available to the public.
- **vipPrice**: The price for minting NFTs available to VIP users.
- **publicMint**: A boolean indicating whether public minting is currently enabled.
- **vipMint**: A boolean indicating whether VIP minting is currently enabled.
- **myMapping**: A mapping that tracks which addresses have VIP status.

### Constructor

The constructor initializes the contract by setting the initial owner and naming the NFT collection "AbubakarSSNFT" with the symbol "ABNFT".

### Functions

#### Minting

- **Public Minting**: Public users can mint NFTs by paying the public price. The function checks if public minting is enabled and if the correct amount is paid.
- **VIP Minting**: VIP users can mint NFTs at a discounted price. The function checks if the sender has VIP status, if VIP minting is enabled, and if the correct amount is paid.

#### VIP Upgrade

- **Upgrade to VIP**: Users can upgrade to VIP status by paying a specified fee. Once upgraded, users can access VIP minting features.

#### Minting Control

- **Pause/Unpause Minting**: The owner can pause or unpause the minting process, providing flexibility and control over the contract's operations.
- **Update Minting Parameters**: The owner can update the minting state, supply limit, and prices for both public and VIP minting.

#### Withdrawal

- **Withdraw Funds**: The owner can withdraw the contract's balance. This function ensures that the collected funds from minting fees can be transferred to the owner securely.

### Integration with OpenZeppelin

The contract integrates multiple OpenZeppelin modules to enhance security and functionality:

- **ERC721**: Provides the standard NFT functionality.
- **ERC721Enumerable**: Adds the ability to enumerate NFTs.
- **ERC721Pausable**: Adds the ability to pause and unpause the contract.
- **Ownable**: Restricts certain functions to the owner of the contract.

## How to Use

1. **Deploy the Contract**: Deploy the contract on the Ethereum blockchain, specifying the initial owner address.
2. **Mint NFTs**:
    - Public users can call the public minting function and pay the public price.
    - VIP users can call the VIP minting function and pay the VIP price.
3. **Upgrade to VIP**: Users can upgrade to VIP status by paying the upgrade fee.
4. **Manage Minting**: The owner can pause/unpause minting and update minting parameters as needed.
5. **Withdraw Funds**: The owner can withdraw the contract's balance at any time.

## Image
![image](https://github.com/user-attachments/assets/27446719-4588-45f4-b6a2-8845d859b09a)

## Contact

For further inquiries or feedback, you can reach out:

- **Email:** abu.bakar.zia146@proton.me
```
