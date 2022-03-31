// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.4.0 <0.9.0;
contract A {
    struct S {
        uint128 a;
        uint128 b;
        uint[2] staticArray;
        uint[] dynArray;
    }

    uint x = 9;
    uint y = 1;
    S s;
    // S s = S(2,3,[uint256(4),uint256(5)], (6,7,8,9));
    address addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    mapping (uint => mapping (address => bool)) map;
    uint[] array;
    string s1;
    bytes b1;

    function structS() external {
        uint[] storage dynArray = s.dynArray;
        //keccak(bytes32(position));
        //in this case slot position is 5;
        //the dynArray starts from
        // 0x036b6384b5eca791c62761152d0c79bb0604c104a5fb6f4eb0703f3154bb3db0;
        dynArray.push(6);
        dynArray.push(7);
        dynArray.push(8);
        dynArray.push(9);
        s.a = 3;
        s.b = 2;

        //In slot 2, it fills up from the right
        //0x0000000000000000000000000000000200000000000000000000000000000003
        s.staticArray = [uint256(4), uint256(5)];
    }
}