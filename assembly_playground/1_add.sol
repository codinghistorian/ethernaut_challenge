// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

// 220329 17:25 KST
//wanted to check what value does add(32bytes, 0x20) would give.
// initially when I looked at
// https://docs.soliditylang.org/en/latest/solidity-by-example.html#safe-remote-purchase
// splitsignature in the above link, I was thinking " isn't the first 32 bytes supposed to be
// mload(0x80)?? so I was curious what 32bytes + 0x20 would give. anyway the bytes dynamic array
// gives
// 160. which is 0xe0. It was super wierd for me..

//Then when I did debugging in remix, I realized what is in 0x80 was the length of the data which is
// 0x20.. So I guess when bytes32 memory is in memory, the first value stored in memory
//is the length. and the rest continues in the next word.

//by the way, bytes32 in add opcode gave 128

//220329 19:00 KSt aaah shit. bytes32 and bytes are difference. bytes is a dynamic array and
//that is why memory keyword is added..!! Need to experiment with bytes32 to see
//how it is whosn differently in memory. maybe bytes32 would not even go to memory
//but would be on stack and added then, the result will be on memory to be returned.
//also the t value problly would change.

contract Test {
    function add(bytes memory _sig) public pure returns (uint t){
        assembly {
            t:= add(_sig, 32)
        }
    }
    function add2(bytes32 _sig) public pure returns (uint t){
        assembly {
            t:= add(_sig, 32)
        }
    }
}

//220329 19:07 KST
//add2 gives me a big ass uint256 number.
//then what is on the stack of add opcode for add?
//let's check out the stack with debugger.

// 0x1c8aff950685c2ed4bc3174f3472287b56d9517b9c948127319a09a7a36deac8
// the above which is keccak256 = 32 bytes gives 0x80...
// why give 128...? which is half of 256...? maybe need to see how 0x80 came up?

//220329 19:21 ah! Eureka! when dynamic bytes array in put on a stack, the offset in the memory
//is added to the stack. so it is 0x80 where the bytes array start. and it is the prefix of length.

//maybe I should try to add different things. I mean all the types available out there.
