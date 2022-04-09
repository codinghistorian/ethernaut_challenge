// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract Calculate {
    address public nonce0;
    function calculate(address _origin) external {
    nonce0= address(uint160(uint256(keccak256(abi.encodePacked(bytes1(0xd6), bytes1(0x94), _origin, bytes1(0x80))))));
    }
}
