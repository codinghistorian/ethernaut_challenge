// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//0xb10e2...cf7 should be the slot that second looong ass string was supposed to take
//and it turns out to be true with you check it with storageCalculation.sol 's keccak(1);

contract StorageTest {
    string public love = "love";
    string public longLove = "lovelovelovelovelovelovelovelovelovelovelovelovelove";
}