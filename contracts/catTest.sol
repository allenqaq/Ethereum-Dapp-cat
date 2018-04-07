pragma solidity ^0.4.18;

contract catTest {

	string public catName;

	function Cat(string _name) public {

		catName = _name;

	}

	function returnName() public view returns (string) {

		return catName;

	}

	function changeName(string _newName) public{

		catName = _newName;

	}
}
