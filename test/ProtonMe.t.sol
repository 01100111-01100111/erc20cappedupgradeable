// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {Test} from "forge-std/Test.sol";
import {Upgrades} from "openzeppelin-foundry-upgrades/Upgrades.sol";
import {ProtonMe} from "src/ProtonMe.sol";

contract ProtonMeTest is Test {
  ProtonMe public instance;

  function setUp() public {
    address defaultAdmin = vm.addr(1);
    address pauser = vm.addr(2);
    address minter = vm.addr(3);
    address upgrader = vm.addr(4);
    address proxy = Upgrades.deployUUPSProxy(
      "ProtonMe.sol",
      abi.encodeCall(ProtonMe.initialize, (defaultAdmin, pauser, minter, upgrader))
    );
    instance = ProtonMe(proxy);
  }

  function testName() public view {
    assertEq(instance.name(), "ProtonMe");
  }
}
