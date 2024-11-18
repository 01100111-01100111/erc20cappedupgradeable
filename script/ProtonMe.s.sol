// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Script} from "forge-std/Script.sol";
import {console} from "forge-std/console.sol";
import {Upgrades, Options} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {ProtonMe} from "src/ProtonMe.sol";

contract ProtonMeScript is Script {
  function setUp() public {}

  function run() public {
    vm.startBroadcast();
    address defaultAdmin = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    address pauser = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    address minter = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    address upgrader = 0x8e5aF3d12B695E20564Db3ceD04f5E721EBF003c;
    uint256 cap = 64646464000000000000000000;
    address proxy = Upgrades.deployUUPSProxy(
      "ProtonMe.sol",
      abi.encodeCall(ProtonMe.initialize, (defaultAdmin, pauser, minter, upgrader, cap))
    );
    ProtonMe instance = ProtonMe(proxy);
    console.log("Proxy deployed to %s", address(instance));
    vm.stopBroadcast();
  }
}
