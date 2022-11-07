// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;


contract Crypto {
    uint balance;

    constructor() {
        balance = 0;
    }

    function depositBalance(uint amount) public {
        balance += amount;
    }
  
    function withdrawBalance(uint amount) public{
        require(balance > amount, "Vous navez pas assez de fond");
        balance -= amount;
    }
      function getBalance() view public returns (uint) {
        return balance;
    }
}
  