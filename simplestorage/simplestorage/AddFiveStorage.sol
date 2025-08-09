
// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import {SimpleStorage} from "./SimpleStorage.sol";
contract Addfive is SimpleStorage{
    function store(uint256 _a) public override {
        myFavoriteNumber=_a+5;
    }
}
