// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "./1_Storage.sol";

contract StorageFactory {

    SimpleStorage[] public simpleStorageList;

    function createStorage() public {
        SimpleStorage simpleStorage = new SimpleStorage();
        simpleStorageList.push(simpleStorage);
    }

    function addEmployee(uint256 _storageIndex, string memory _name, uint256 _age, uint256 _salary) public  {
        SimpleStorage simpleStorage = simpleStorageList[_storageIndex];
        simpleStorage.addEmployee(_name, _age, _salary);
    }

    function getEmployeeSalary(uint256 _storageIndex, string memory _name) public view returns (uint256) {
        SimpleStorage simpleStorage = simpleStorageList[_storageIndex];
        return simpleStorage.employeeSalary(_name);
    }
}
