// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter{
        function getprice() internal  view returns (uint256) {
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        ( uint256 price,,,, ) = priceFeed.latestRoundData();
        return uint256(price*1e10);
    }

    function Convert(uint256 ethamount) internal view returns(uint256){
        uint256 price = getprice();
        uint256 usdamount = (ethamount*price)/1e18;
        return usdamount;


    }
}