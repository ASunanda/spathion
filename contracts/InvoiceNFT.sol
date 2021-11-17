// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./External/ERC721.sol";
import "./External/Counters.sol";
import "./External/SafeMath.sol";
import "./External/Ownable.sol";


contract InvoiceNFT is ERC721,Ownable {
    
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    
    
    struct Invoice {

      address owner;
      string tokenURI;
      uint256 tokenId;
      uint256 InvoiceValue;
      uint256 LoanAmount;
      uint256 Duration;
     
    }
    
    mapping(uint256 => Invoice) private IdToInvoice;
    
    
    Invoice[] internal AllInvoices;
    
    // token exist
    
    mapping(uint256 => bool) public exists;
    
    uint256[] tokenIds;
    
    address InvoicePool;
    
  
   // constructor

    constructor () ERC721("Invoice","INVT") {
        
        // setting base URI
        
        _baseURI();

    }
   
   
   //  Minting a token
   
   function mint(
       
    string memory _tokenURI,
    uint256 _LoanAmount,
    uint256 _InvoiceValue,
    uint256 _duration
    
    ) public returns (uint256) {
       
       // Incremnting total supply
       
        _tokenIds.increment();
        
        uint256 _tokenId = _tokenIds.current();
       
       _mint(msg.sender, _tokenId);               // mint

       _setTokenURI(_tokenId, _tokenURI);         // setting tokenURI
       
      
       uint256 duration = block.timestamp + (_duration * 1 days);
       
       
       Metadata(msg.sender,_tokenURI,_tokenId,_InvoiceValue,_LoanAmount,duration);
       
        
       return _tokenId;                         // tokenId of an nft 
    
    }
    
    
    function Metadata(
        
        
      address _owner,
      string memory _tokenURI,
      uint256 _tokenId,
      uint256 _InvoiceValue,
      uint256 _LoanAmount,
      uint256 _Duration
    
            
        ) public {
            
            
            
            Invoice memory _Invoice  = Invoice ({
                
                owner:_owner,
                tokenURI:_tokenURI,
                tokenId:_tokenId,
                InvoiceValue:_InvoiceValue,
                LoanAmount:_LoanAmount,
                Duration:_Duration
                
            });
            
            
            IdToInvoice[_tokenId] = _Invoice;
            
            
           // updating array of AllInvoice   
            
            
             AllInvoices.push(_Invoice);
           
           
           // updating array of tokenIds
           
           
             tokenIds.push(_tokenId);
           
           
           // updating xistence of tokenId
           
           
             exists[_tokenId]== true;
         
           
        }
        
        
        
    function viewInvoiceById (uint256 _tokenId) public view returns (Invoice memory ) {

       Invoice memory c = IdToInvoice[_tokenId];

       return c;
    }

  
    function getAllInvoices() public view returns (Invoice[] memory)  {
        
        
        return AllInvoices;
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}    