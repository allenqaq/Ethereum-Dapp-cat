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

		// attributes.height = 20;
		// attributes.weight = 30;
		// attributes.age = 1;
		// attributes.energypoint = 100;

        attributes = Attributes({

	        height : 20,
	        weight : 30,
	        age : 1,
		    energypoint : 100,
		    emotion : Emotion.happy,
		    color : Color.Red

	    });
	}

	function BuytheCat() public {

		owner = msg.sender;

	}

	// function randomEmotion () public {

	// }

	// function returnAttirbutes() public view returns (string[]){

	// 	string[] str;
	// 	str.push(string(catName));
	// 	str.push(string(attributes.height));
	// 	str.push(string(attributes.weight));
	// 	str.push(string(attributes.age));
	// 	str.push(string(attributes.energypoint));
	// 	str.push(string(attributes.emotion));
	// 	str.push(string(attributes.color));
	// 	return str;
	// }

	function returnName () public view returns  (string) {

		return catName;

	}

	function returnHeight () public view returns (uint) {

		return attributes.height;

	}

	function returnWeight () public view returns (uint) {

		return attributes.weight;

	}

	function returnAge () public view returns (uint) {

		return attributes.age;

	}

	function returnEnergypoint () public view returns (uint) {

		return attributes.energypoint;

	}

	function returnEmotion () public view returns (string) {

		if(attributes.emotion == Emotion.happy){
			return "happy";
		}
		if(attributes.emotion == Emotion.sad){
			return "sad";
		}
		if(attributes.emotion == Emotion.normal){
			return "normal";
		}

	}

	function returnColor () public view returns (string) {

		if(attributes.color == Color.Red){
			return "rad";
		}
		if(attributes.color == Color.Green){
			return "Green";
		}

	}




	function changeEmotion (Emotion _emotion) public {

		attributes.emotion = _emotion;

	}
	


	modifier onlyOwner { 

		// only the owner can playwith the cat
		require (msg.sender == owner);

		// back to the origin codes
		_;

	}

	function run () onlyOwner public {

		changeEmotion (Emotion.happy);
		attributes.energypoint -= 5;

	}
	
	function fishing () onlyOwner public {

		changeEmotion (Emotion.happy);
		attributes.energypoint -= 5;

	}

	function sleep () onlyOwner public {

		changeEmotion (Emotion.normal);
		attributes.energypoint += 5;
		attributes.weight += 1;

	}

	function eat () onlyOwner public {

		changeEmotion (Emotion.happy);
		attributes.energypoint += 5;
		attributes.weight += 1;

	}

	function sports () onlyOwner public {

		changeEmotion (Emotion.happy);
		attributes.energypoint -= 5;

	}

	function playwith () onlyOwner public {

		changeEmotion (Emotion.happy);
		attributes.energypoint += 5;
		attributes.weight -= 1;
		attributes.height += 1;

	}
	
// 	function randomEmotion () public pure returns (Emotion) {
//         uint random = uint(sha3(owner));
// 		return Emotion(random); 

// 	}

	function grow () onlyOwner public {

		attributes.age += 1;
		attributes.weight += 1;
		attributes.height += 1;

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
