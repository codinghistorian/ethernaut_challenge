// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract CalculateKeccak {
    uint64 public leftHand;
    function calculateKeccak(address _origin) external {
    leftHand = uint64(bytes8(keccak256(abi.encodePacked(msg.sender))));
    }
}


