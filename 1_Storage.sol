// SPDX-License-Identifier: MIT
pragma solidity >=0.7.0 <0.9.0;

contract SimpleStorage {

    Person[] public employees;

    struct Person {
        string name;
        uint256 age;
    }

    function addPerson(string memory _name, uint256 _age) public {
        employees.push(Person(_name, _age));
    }
}
