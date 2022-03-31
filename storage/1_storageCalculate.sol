// SPDX-License-Identifier: GPL-3.0

//220331 18:16
// they say for dynamic arrays, the real storage value is obtained by the formula keccak256(bytes32(position))
// Just wanted to see if it is true. I tried to put 0 in the keccak function and see if gives 0x290...563


pragma solidity >=0.7.0 <0.9.0;
contract HexToBytes {

    function hexToBytes(uint256 haha) pure external returns(bytes32){
        return bytes32(haha);
    }

    function keccak(uint256 haha) pure external returns(bytes32) {
        return keccak256(abi.encode(haha));
    }
}