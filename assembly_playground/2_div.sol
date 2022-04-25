// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

//220425 15:07 KST
//The reason I am doing this is because in the runtime code of solidity smart contract
//there is this part of Function selector. 
//PUSH4 ffffffff
//PUSH29 0x000000001000000....
//PUSH1 00
//CALLDATALOAD
//DIV
// and the div here is doing div(0xfasdfsdfa00000...., 0x00000000100000000)
//which gives the result of just 0x00000....0000fasdfsdfa  which is 32 bytes(a word)
// when I looked up all those documentation, DIV was a uint256  division.
//then I start to think, so it is going to just divide the first 32 bytes who will be the
//child in devision?... I want to experiment in this sol file what kind of result that this
//Yul code gives.....

//Imma do the actually Javascript VM in remix, I am lazy. but I will leave the sol code here
//and push it to the github for the record.


contract Div {
    function div() external returns(bytes32) {
        bytes memory x;
        bytes memory y;
        bytes32 z;
        assembly {
            x := 0xfafafafa00000000000000000000000000000000000000000000000134313
            y := 0x00000000100000000000000000000000000000000000000000000000000000
            z := div(x, y)
        }
        return z;
    }
}

//220425 15:34 KST
// I have no idea why the function above does not return anything.
// ah.... ah... assembly has its own scope...right...
// I should try to return it inside the assembly block.;
// anyway the x and y above gives just the fafafafa.
//If I make the x shorter, by 1 bytel it gives fafafa
//if I make y shorter... I need to check I think it was fafafafa00 but still need to check.