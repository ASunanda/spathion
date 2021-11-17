// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./InvoiceNFT.sol";
import "./External/Counters.sol";
import "./External/ReentrancyGuard.sol";
import "./External/ERC721.sol";


contract InvoicePool is ReentrancyGuard {
    
    
    using Counters for Counters.Counter;
    
    Counters.Counter private DepositedInvoices;
    
    IERC721 Invoicenft;
   
    
    constructor(address _Invoicenft) {
        
        
      Invoicenft = IERC721(_Invoicenft);
       
    
        
    }
    
    
    function deposit( uint256 _tokenId)  public {
        
        
       DepositedInvoices.increment();
        
        
       IERC721(Invoicenft).transferFrom(msg.sender, address(this),_tokenId);
      
        
    }
    
    
    
    
    
    
  
  
}