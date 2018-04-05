contract Cat {

	string public catName;
	address public owner;


	function Cat(string _name) public {

		catName = _name;
		owner = msg.sender;

	}

	modifier onlyOwner { 

		// only the owner can kill the cat
		require (msg.sender == owner);

		// back to the origin codes
		_;

	}

	// end up the smart contract
	function kill() onlyOwner public {
		selfdestruct(owner);

	}

}
