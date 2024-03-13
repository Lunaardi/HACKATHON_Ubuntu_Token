// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import {Script, console2} from "forge-std/Script.sol";
import {Token} from "../src/Token.sol";

contract TokenScript is Script {

    Token token;

    function setUp() public {}

    function run() public {
        vm.startBroadcast(0xac0974bec39a17e36ba4a6b4d238ff944bacb478cbed5efcae784d7bf4f2ff80);

        token = new Token();

        token.transferFrom(0xf39Fd6e51aad88F6F4ce6aB8827279cffFb92266, 0x70997970C51812dc3A010C7d01b50e0d17dc79C8, 5000);

        console2.log("Address: ", address (0x70997970C51812dc3A010C7d01b50e0d17dc79C8));

        vm.stopBroadcast();
    }
}
// coment