// SPDX-License-Identifier: MIT
pragma solidity 0.8.30;

import {SimpleStorage} from "./SimpleStorage.sol";
contract StorageFactory{
    SimpleStorage[] public listofsimplestorage;
    
    function CreateSimpleStorageContract() public {
        SimpleStorage newsimplestorage=new SimpleStorage();
        listofsimplestorage.push(newsimplestorage);


    }
    function sistore(uint256 SimpleStorageIndex,uint256 _NewSimpleStorageNo) public {
        SimpleStorage mysimplestorage=SimpleStorage(listofsimplestorage[SimpleStorageIndex]);
        mysimplestorage.store(_NewSimpleStorageNo);

    }    
    function sfget(uint256 SimpleStorageIndex) public view returns (uint256 ){
        return listofsimplestorage[SimpleStorageIndex].retrieve();
    }
    
}