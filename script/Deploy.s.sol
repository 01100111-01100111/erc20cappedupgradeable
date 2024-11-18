// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Upgrades, Options} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {Defender, ApprovalProcessResponse} from "openzeppelin-foundry-upgrades/Defender.sol";
import {ProtonMe} from "src/ProtonMe.sol";

contract ProtonMeScript is Script {
  function setUp() public {}

  function run() public {
    ApprovalProcessResponse memory upgradeApprovalProcess = Defender.getUpgradeApprovalProcess();

    if (upgradeApprovalProcess.via == address(0)) {
        revert(
            string.concat(
                "Upgrade approval process with id ",
                upgradeApprovalProcess.approvalProcessId,
                " has no assigned address"
            )
        );
    }

    Options memory opts;
    opts.defender.useDefenderDeploy = true;

    address defaultAdmin = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    address pauser = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    address minter = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    address upgrader = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    uint256 cap = 64646464000000000000000000;

    Upgrades.deployUUPSProxy("ProtonMe.sol", abi.encodeCall(ProtonMe.initialize, (defaultAdmin, pauser, minter, upgrader, cap)), opts);
    }
}
