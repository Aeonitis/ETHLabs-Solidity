pragma solidity ^0.4.0;

// Exercise on conditionals with string output
contract SomeContract {
    uint256 someVar;
    
    function getMyVar() constant returns (string) {
        if(someVar > 2) {
            return "greater than two";
        } else if (someVar == 2) {
            return "is exactly two";
        } else {
            return "smaller than two";
        }
    }
    
    function getMyVars() constant returns (string, uint) {
        if(someVar > 2) {
            return ("greater than two", someVar);
        } else if (someVar == 2) {
            return ("is exactly two", someVar);
        } else {
            return ("smaller than two", someVar);
        }
    }
    
    function setMyVar(uint myVar) {
        someVar = myVar;
    }
    
    function getWhile() constant returns (uint) {
        uint i = 0;
        while(i<5) {
            i++;
        }
        return i;
    }
}