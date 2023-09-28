// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

contract TimeLockFund {
    address public owner;

    mapping(address => uint) public lockedFunds;
    mapping(address => uint) public lockedTimestamps;

    uint public lockDuration = 1 days;

    constructor() {
        owner = payable(msg.sender);
    }

    function lockFunds(uint _value) public payable {
        require(msg.value >= _value, "Amount being sent should be greater than the value provided!");

        lockedFunds[msg.sender] = _value;
        lockedTimestamps[msg.sender] = block.timestamp;
    }

    function releaseFunds() public {
        require(block.timestamp >= lockedTimestamps[msg.sender] + lockDuration, "Please wait till the cooling period!");

        payable(owner).transfer(lockedFunds[msg.sender]);
        
        delete lockedFunds[msg.sender];
        delete lockedTimestamps[msg.sender];
    }

    function withdraw() public {
        require(msg.sender == owner, "Only owner can withdraw the funds!");
        require(address(this).balance > 0, "No funds available to withdraw!");

        payable(owner).transfer(address(this).balance);
    }
}