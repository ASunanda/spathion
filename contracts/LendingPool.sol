// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.0;

import "./External/IERC20.sol";
import "./External/Ownable.sol";
import "./External/SafeMath.sol";
import "./External/Pausable.sol";
import "./External/ReentrancyGuard.sol";

contract LendingPool is Ownable {
    
using SafeMath for uint256;    

IERC20 private USDT; 

 //  user USDT

mapping(address => uint256) public USDT_Deposited;

// Total deposited usdt

uint256 private TotalUSDT_Deposited;

// Borrowe usdt of the user

mapping(address => uint256) public USDT_Borrowed;

// Total Borrowed usdt

uint256 private TotalUSDT_Borrowed;

event Received(address,uint);


constructor(address _USDT) {
    
    USDT = IERC20(_USDT);
}


receive() external payable {
    
   emit Received(msg.sender,msg.value);

}


// Deposit Usdt


function Deposit(uint256 amount) public  {
    

      USDT.transferFrom(msg.sender, address(this), amount);
      
      // updating user Balances
     
      USDT_Deposited[msg.sender] = USDT_Deposited[msg.sender].add(amount);
      
      // updating total balances
      
      TotalUSDT_Deposited = TotalUSDT_Deposited.add(amount);
     
    
}


// withdraw 


function withdraw(uint256 amount) external  {
    
    
    require (USDT_Deposited[msg.sender] >= amount);
    
      // starting balance
      
      uint InitialBalance = USDT_Deposited[msg.sender];
    
      // Final balance
      
      uint FinalBalance = InitialBalance.sub(amount);
    
      // Transfer amount
      
      USDT.transfer(msg.sender,amount);
      
      // Reset staking Balances
      
      USDT_Deposited[msg.sender] = FinalBalance;
      
      // updating total Balances
      
      TotalUSDT_Deposited = TotalUSDT_Deposited.sub(amount);
      
    
    
}






    
}
