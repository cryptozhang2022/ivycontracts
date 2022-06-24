// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

/**
 * @title Linked to IVY Marker Interface
 *
 * @notice Marks smart contracts which are linked to IvyERC20 token instance upon construction,
 *      all these smart contracts share a common IVY() address getter
 *
 * @notice Implementing smart contracts MUST verify that they get linked to real IvyERC20 instance
 *      and that IVY() getter returns this very same instance address
 *
 * @author Basil Gorin
 */
interface ILinkedToIVY {
  /**
   * @notice Getter for a verified IvyERC20 instance address
   *
   * @return IvyERC20 token instance address smart contract is linked to
   */
  function ivy() external view returns (address);
}