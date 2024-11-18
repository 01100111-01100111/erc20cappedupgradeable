// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";

import {ProposeUpgradeResponse, Defender, Options} from "openzeppelin-foundry-upgrades/Defender.sol";

contract DefenderScript is Script {
    function setUp() public {}

    function run() public {
        Options memory opts;
        ProposeUpgradeResponse memory response = Defender.proposeUpgrade(
            0x3f8bA6FD111b7ABD223800B82C6b410f200Da700, //Existing Proxy Address
            "ProtonMeV2.sol", //New ERC20Upgradeable Contract
            opts
        );
        console.log("Proposal id", response.proposalId);
        console.log("Url", response.url);
    }
}
