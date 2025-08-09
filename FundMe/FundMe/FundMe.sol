// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;
import {PriceConverter} from "./PriceConvertor.sol";

contract FundMe {
    using PriceConverter for uint256;



    address[] public funders;
    mapping ( address funder => uint256 amtfunded) public addressToAmountFunded;
    uint256 public constant MIN_MONEY=5e18;

    address public immutable i_owner;


    constructor(){
        i_owner=msg.sender;


    }


    function fund() public payable {

   
       
        require(msg.value.Convert() >= MIN_MONEY,"You need to spend more ETH!");
        addressToAmountFunded[msg.sender]+=msg.value;

    }

    function withdraw() public  {

        for (uint256 fundindex=0; fundindex<funders.length; fundindex++) 
        {
            address funder =funders[fundindex];
            addressToAmountFunded[funder]=0;
        
        }
        funders=new address[](0);

        //payable(msg.sender).transfer(address(this).balance);

        //bool SendSuccess=payable(msg.sender).send(address(this).balance);
        //require(SendSuccess,"Send succes failed");

        (bool Callsuccess,)=payable(msg.sender).call{value:address(this).balance}("");
        require(Callsuccess,"Call failed");

    }

modifier Onlyowner(){
    require(msg.sender==i_owner, "you are not owner");
    _;
}

receive() external payable { 
    fund();
}
fallback() external payable { 
    fund();
}
}