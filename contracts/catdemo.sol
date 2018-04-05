pragma solidity ^0.4.18;
/**
 * A Cat smart contract demo
 */
contract Cat {

	string public catName;
	address public owner;

	enum Color { Red, Green }
	enum Emotion { happy, sad, normal}
	

	struct Attributes {
		uint height;
		uint weight;
		uint age;
		uint energypoint;

		Emotion emotion;
		Color color;
	}
	
	Attributes public attributes;

	// mapping (address => attributes) catAttributes;
	

	function Cat(string _name) public {

		catName = _name;
		owner = msg.sender;

// 		attributes.height = 20;
// 		attributes.weight = 30;
// 		attributes.age = 1;
// 		attributes.energypoint = 100;

        attributes = Attributes({

	        height : 20,
	        weight : 30,
	        age : 1,
		    energypoint : 100,
		    emotion : "happy"

	    });
	}

	modifier onlyOwner { 

		// only the owner can playwith the cat
		require (msg.sender == owner);

		// back to the origin codes
		_;

	}

	function run () onlyOwner public {

		attributes.energypoint -= 5;

	}
	

	function sleep () onlyOwner public {
		
		attributes.energypoint += 5;

	}


// 	function CatsInteract (address _cat2address) public {
// 		require (owner != _cat2address);

// 		Cat cat2 = Cat(_cat2address);
// 		// to interact with other cats
		
// 	}
	

	// end up the smart contract
	function kill() onlyOwner public {
		selfdestruct(owner);

	}
}
