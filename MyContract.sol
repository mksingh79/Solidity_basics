//SPDX-License-Identifier: UNLICENSED

pragma solidity 0.8.10;

contract MyContract{
    uint public x = 21;
    mapping (uint => int) public map;
    address public lastSender;

    function setX(uint _x) public {
        x = _x;
    }

    function setKey(uint key, int value) public{
        map[key] = value;
    }

    function receive() external payable {
        lastSender = msg.sender;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    function pay(address payable addr) public payable {
        (bool sent, bytes memory data) = addr.call{value: 100}("Sending eth!");
        require(sent, "Error sending eth!");
    }

} 
