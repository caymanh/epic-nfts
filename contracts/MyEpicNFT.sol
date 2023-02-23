// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.17;

// import OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// inherit the we imported and access the inherited contract's methods.
contract MyEpicNFT is ERC721 {
  // keep track of tokenIds with OpenZeppelin 
  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;

  // pass the name of NFTs token and its symbol.
  constructor() ERC721 ("SquareNFT", "SQUARE") {
    console.log("This is my NFT contract. Woah!");
  }

  // A function user will hit to get the NFT.
  function makeAnEpicNFT() public {
     // Get the current tokenId; starts at 0.
    uint256 newItemId = _tokenIds.current();

     // mint the NFT to the sender using msg.sender.
    _safeMint(msg.sender, newItemId);
    
    // Return the NFT's metadata
    tokenURI(newItemId);

    // Increment the counter for when the next NFT is minted.
    _tokenIds.increment();
  }

  // Set the NFT's metadata
  function tokenURI(uint256 _tokenId) public view override returns (string memory) {
    require(_exists(_tokenId));
    console.log("An NFT w/ ID %s has been minted to %s", _tokenId, msg.sender);
    return "https://jsonkeeper.com/b/0OZR";
  }
}