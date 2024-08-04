// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Pausable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AbubakarSNFT is ERC721, ERC721Enumerable, ERC721Pausable, Ownable {
    uint256 private _nextTokenId;
    uint256 public maxSupply = 1000;
    uint256 public publicPrice = 0.002 ether;
    uint256 public vipPrice = 0.001 ether;
    bool public publicMint = true;
    bool public vipMint = true;

    mapping(address => bool) public myMapping;

    constructor(address initialOwner) ERC721("AbubakarSSNFT", "ABNFT") Ownable(initialOwner) {}

    function _baseURI() internal pure override returns (string memory) {
        return "<Enter your IPFS link>";
    }

    function pause() public onlyOwner {
        _pause();
    }

    function unpause() public onlyOwner {
        _unpause();
    }

   function updateMintingState_Supply_and_price(
    bool _publicMint, 
    bool _vipMint, 
    uint256 _maxSupply, 
    uint256 _publicPrice, 
    uint256 _vipPrice
) 
    external 
    onlyOwner 
{
    vipMint = _vipMint;
    publicMint = _publicMint;
    maxSupply = _maxSupply;
    publicPrice = _publicPrice;
    vipPrice = _vipPrice;
}



    function mintForVIPs() public payable {
        require(myMapping[msg.sender] == true, "To access VIP features, please upgrade to VIP.");
        require(vipMint == true, "Right now the minting is closed");
        require(msg.value == vipPrice, "Incorrect Amount");
        internalMint();
    }

    function mintForPublic() public payable {
        require(publicMint == true, "Right now the minting is closed");
        require(msg.value == publicPrice, "Incorrect Amount");
        internalMint();
    }

    function internalMint() internal {
        require(totalSupply() < maxSupply, "Sold Out");
        uint256 tokenId = _nextTokenId++;
        _safeMint(msg.sender, tokenId);
    }

    function upgradeToVIP() external payable {
        require(myMapping[msg.sender] == false, "You are already a VIP");
        require(msg.value == 4 ether, "Incorrect Amount");
        myMapping[msg.sender] = true;
    }

    function withdraw() external onlyOwner {
    uint256 balance = address(this).balance;
    require(balance > 0, "No funds to withdraw");

    (bool success, ) = payable(owner()).call{value: balance}("");
    require(success, "Transfer failed");
}

    // The following functions are overrides required by Solidity.

    function _update(address to, uint256 tokenId, address auth)
        internal
        override(ERC721, ERC721Enumerable, ERC721Pausable)
        returns (address)
    {
        return super._update(to, tokenId, auth);
    }

    function _increaseBalance(address account, uint128 value)
        internal
        override(ERC721, ERC721Enumerable)
    {
        super._increaseBalance(account, value);
    }

    function supportsInterface(bytes4 interfaceId)
        public
        view
        override(ERC721, ERC721Enumerable)
        returns (bool)
    {
        return super.supportsInterface(interfaceId);
    }
}