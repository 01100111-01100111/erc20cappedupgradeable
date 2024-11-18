// SPDX-License-Identifier: MIT
// Compatible with OpenZeppelin Contracts ^5.0.0
pragma solidity ^0.8.22;

import {ProtonMe} from "./ProtonMe.sol";

/// @title ProtonMev2
/// @notice An improved ProtonMe with versioning
/// @custom:oz-upgrades-from ProtonMe
contract ProtonMeV2 is ProtonMe {
    /// @notice Returns the ProtonMe version.
    function protonMeVersion() external pure returns (uint256) {
        return 2;
    }
}
