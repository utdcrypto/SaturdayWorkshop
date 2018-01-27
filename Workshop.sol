pragma solidity ^0.4.16;

contract Workshop {
    
    //top scope after contract initialization declares global variables
    address public owner;

    // public variables are visible to all parties, and the compiler automatically
    // creates getter functions for said variables
    string public visibleString = "";
    bytes32 public visibleBytes = "";

    // The first function (that MUST share the same name as the contract) is the 
    // constructor; it runs exactly one on deployment, and can never be re-run
    function Workshop() public {
        owner = msg.sender;
    }
    
    function setString(string _inString) public returns (string retString) {
        visibleString = _inString;
        return _inString;
    }
    
    function depositEth() payable public returns (bool success) {
        return true;
    }

    function getMoney() public returns (bool success) {
        require(msg.sender == owner);
        msg.sender.transfer(this.balance);
        return true;
    }

}