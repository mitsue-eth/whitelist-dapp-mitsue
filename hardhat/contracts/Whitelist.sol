//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

contract Whitelist {
  uint8 public maxWhitelistedAddresses;

  mapping(address => bool) public whitelistedAddresses;

  uint8 public numAddressesWhitelisted;

  constructor(uint8 _maxWhitelistedAddresses) {
    maxWhitelistedAddresses = _maxWhitelistedAddresses;
  }

  //add address of the sender to whitelist

  function addAddressToWhitelist() public {
    //check if user has already been whitelisted
    require(!whitelistedAddresses[msg.sender], "You have already been whitelisted");

    require(numAddressesWhitelisted < maxWhitelistedAddresses, "More addresses cannot be added to whitelist");

    whitelistedAddresses[msg.sender] = true;
    numAddressesWhitelisted += 1;

  }
}