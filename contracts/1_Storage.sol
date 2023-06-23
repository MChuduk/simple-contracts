// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

contract SimpleStorage {

    Person[] public employees;

    mapping(string => uint256) public salaries;

    struct Person {
        string name;
        uint256 age;
    }

    function employeeSalary(string memory _name) public view returns(uint256) {
        return salaries[_name];
    }

    function addEmployee(string memory _name, uint256 _age, uint256 _salary) public {
        employees.push(Person(_name, _age));
        salaries[_name] = _salary;
    }
}
