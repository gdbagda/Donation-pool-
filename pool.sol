// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CharityDonationPool {
    address payable public owner;

    // Set the contract deployer as the owner
    function setOwner() public {
        if (owner == address(0)) {
            owner = payable(msg.sender);
        }
    }

    // Receive ETH donations
    receive() external payable {}

    // Withdraw function (only owner can call)
    function withdraw() public {
        if (msg.sender == owner) {
            owner.transfer(address(this).balance);
        }
    }

    // Check contract balance
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
