// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Bank {
    mapping(address => uint) public balances;
    bool public open = true;

    function deposit() public payable {
        require(open, "Bank is closed");
        require(msg.value > 0, "Must deposit more than zero");
        balances[msg.sender] += msg.value;
    }

    function withdraw(uint amount) public {
        if (amount > balances[msg.sender]) {
            revert("Insufficient funds");
        }
        balances[msg.sender] -= amount;
        payable(msg.sender).transfer(amount);
    }

    function checkStatus() public view {
        assert(open);
    }

    
}
