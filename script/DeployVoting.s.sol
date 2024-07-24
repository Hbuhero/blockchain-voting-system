// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.18;

import {Script, console} from "forge-std/Script.sol";
import {Voting} from "../src/Voting.sol";

contract DeployVoting is Script {
    function run() external returns (Voting) {
        vm.startBroadcast();
        Voting voting = new Voting();
        vm.stopBroadcast();

        return voting;
    }
}
