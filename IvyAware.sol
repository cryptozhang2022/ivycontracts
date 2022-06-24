// SPDX-License-Identifier: MIT
pragma solidity 0.8.1;

import "./IvyERC20.sol";
import "./ILinkedToIVY.sol";

/**
 * @title Ivy Aware
 *
 * @notice Helper smart contract to be inherited by other smart contracts requiring to
 *      be linked to verified IvyERC20 instance and performing some basic tasks on it
 *
 * @author Basil Gorin
 */
abstract contract IvyAware is ILinkedToIVY {
  /// @dev Link to IVY ERC20 Token IvyERC20 instance
  address public immutable override ivy;

  /**
   * @dev Creates IvyAware instance, requiring to supply deployed IvyERC20 instance address
   *
   * @param _ivy deployed IvyERC20 instance address
   */
  constructor(address _ivy) {
    // verify IVY address is set and is correct
    require(_ivy != address(0), "IVY address not set");
    require(IvyERC20(_ivy).TOKEN_UID() == 0x83ecb176af7c4f35a45ff0018282e3a05a1018065da866182df12285866f5a2c, "unexpected TOKEN_UID");

    // write IVY address
    ivy = _ivy;
  }

  /**
   * @dev Executes IvyERC20.safeTransferFrom(address(this), _to, _value, "")
   *      on the bound IvyERC20 instance
   *
   * @dev Reentrancy safe due to the IvyERC20 design
   */
  function transferIvy(address _to, uint256 _value) internal {
    // just delegate call to the target
    transferIvyFrom(address(this), _to, _value);
  }

  /**
   * @dev Executes IvyERC20.transferFrom(_from, _to, _value)
   *      on the bound IvyERC20 instance
   *
   * @dev Reentrancy safe due to the IvyERC20 design
   */
  function transferIvyFrom(address _from, address _to, uint256 _value) internal {
    // just delegate call to the target
    IvyERC20(ivy).transferFrom(_from, _to, _value);
  }

  /**
   * @dev Executes IvyERC20.mint(_to, _values)
   *      on the bound IvyERC20 instance
   *
   * @dev Reentrancy safe due to the IvyERC20 design
   */
  function mintIvy(address _to, uint256 _value) internal {
    // just delegate call to the target
    IvyERC20(ivy).mint(_to, _value);
  }

}