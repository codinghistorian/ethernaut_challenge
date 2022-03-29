// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// 220329 17:25 KST
//wanted to check what value does add(32bytes, 0x20) would give.
// initially when I looked at
// https://docs.soliditylang.org/en/latest/solidity-by-example.html#safe-remote-purchase
// splitsignature in the above link, I was thinking " isn't the first 32 bytes supposed to be
// mload(0x80)?? so I was curious what 32bytes + 0x20 would give. anyway it kept giving me
// 160. which is 0xe0. It was super wierd for me..

//Then when I did debugging in remix, I realized what is in 0x80 was the length of the data which is
// 0x20.. So I guess when bytes32 memory is in memory, the first value stored in memory
//is the length. and the rest continues in the next word.

//by the way, bytes32 in add opcode gave 128

contract Test {
    function add(bytes memory _sig) public pure returns (uint t){
        assembly {
            t:= add(_sig, 32)
        }
    }
}
