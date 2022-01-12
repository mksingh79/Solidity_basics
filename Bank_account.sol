//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.10;

contract BankAccnt{
    mapping(address => uint) private addrBalance;

    function deposit() external payable {
        addrBalance[msg.sender] += msg.value;
    } 

    function withdraw(address payable addr, uint amt) public payable {
        require(addrBalance[addr] >= amt, "Insufficient funds!"); // check if the address has sufficient balance
        (bool sent, bytes memory data) = addr.call{value: amt}("Amount withdrawn!");
        require(sent, "Error with withdraw!"); // success check
        addrBalance[msg.sender] -= amt; //subtract the amount from balance
    }

    function getBalance() public view returns (uint){
        return address(this).balance;
    }
}
