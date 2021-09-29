// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./ERC721.sol";
import "./Counters.sol";
import "./SafeMath.sol";
import "./Ownable.sol";


contract Invoice is ERC721,Ownable {

    using SafeMath for uint256;

    using Counters for Counters.Counter;
  
    Counters.Counter internal tokenIds;
    
      
    
    // constructor

    
    constructor (address owner,string memory name, string memory symbol,string memory _uri) ERC721(name, symbol) {
      
      mint(owner,_uri);       
      
    }
   
   
   //  Minting a token
   
   
    function mint(address to, string memory tokenURI)  public returns (uint256) {
   
       tokenIds.increment();                    // incrementing tokenId   

       uint256 tokenId = tokenIds.current();
      
       _mint(to, tokenId);                      // mint

       _setTokenURI(tokenId, tokenURI);         // setting tokenURI

       return tokenId;                          // tokenId of an nft 
    
    }
    
    
    // base tokenURI
    
    
    function _baseURI() internal view virtual override returns (string memory) {
        
        return "https://ipfs.io/ipfs/";
    }

    
    
}   
