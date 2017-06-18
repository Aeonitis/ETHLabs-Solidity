pragma solidity ^0.4.0;

// Exercise on Interacting between contracts
contract SimpleDapp {
    uint someVar;
    
    function setSomeVar(uint myVar) {
        someVar = myVar;
    }
    
    function getSomeVar() constant returns (uint) {
        return someVar;
    }
    
    function setSomeVarTimesFour(uint myVar) {
        setSomeVar(4 * myVar);
    }
}

contract SomeOtherSimpleDapp {
    SimpleDapp simpleDapp;
    SimpleDapp newInstanceOfSimpleDapp;
    
    function SomeOtherSimpleDapp(address whereIsMyOtherContract) {
        // Method 1: Interacts only through address of other contract referenced above
        simpleDapp = SimpleDapp(whereIsMyOtherContract);
        // Method 2: Interacts through a new Instance of the contract
        newInstanceOfSimpleDapp = new SimpleDapp();
    }
    
    //Returning from reference address
    function getSimpleDappSomeVar() constant returns (uint) {
        return simpleDapp.getSomeVar();
    }
    
    //Returning from new Instance
    function getNewInstanceOfSimpleDappSomeVar() constant returns (uint) {
        return newInstanceOfSimpleDapp.getSomeVar();
    }
}