pragma solidity ^0.4.0;

// 'Super' ensures that if some other contract calls 'Final.kill' it will kill Base 1 first,
//  which will:
//      cleanup 1 - cascade down to the next contract in the inheritance graph will be called i.e. Base 2.
//      cleanup 2 - cascade from Base 2 to call mortal.kill next
contract owned {
	function owned() { owner = msg.sender; }
	address owner;	
}

contract mortal is owned {
	function kill() {
		if (msg.sender == owner) selfdestruct(owner);
	}
}

contract Base1 is mortal {
	function kill() { /* do cleanup 1 */ super.kill(); }
}

contract Base2 is mortal {
	function kill() { /* do cleanup 2 */ super.kill(); }
}

contract Final is Base1, Base2 {
	
}