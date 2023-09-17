// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";

import {Attack} from "../src/Attack.sol";

// GatekeeperTwo contract address: 0x72215f7dD018277cAB588BC88B7874C63F07E6B6

contract DeployAttack is Script {
    function run() external returns (Attack) {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        address attackAddr = 0x72215f7dD018277cAB588BC88B7874C63F07E6B6;

        vm.startBroadcast(deployerPrivateKey);
        Attack attack = new Attack(attackAddr);
        vm.stopBroadcast();

        return (attack);
    }
}

// forge script script/DeployAttack.s.sol:DeployAttack --rpc-url $SEPOLIA_RPC_URL --broadcast --verify -vvvv
