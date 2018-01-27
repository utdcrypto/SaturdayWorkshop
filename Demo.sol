pragma solidity ^0.4.16;

contract Demo {
    
    address public owner;
    mapping (uint => string) public stringMap;
    mapping (uint => bytes32) public bytesMap;

    event Stringlog(string indexed _logged);
    event Byteslog(bytes32 indexed _logged);

    uint public z = 3;

    function Demo() public {
        owner = msg.sender;
    }
    
    function setString(uint _p, string _nyuString) public returns (string retString) {
        stringMap[_p] = _nyuString;
        return stringMap[_p];
    }
    
    function setBytes(uint _p, bytes32 _nyuBytes) public returns (bytes32 retBytes) {
        bytesMap[_p] = _nyuBytes;
        return retBytes;
    }
    
    function logString(string _nyuString) public returns (string retString) {
        Stringlog(_nyuString);
        return _nyuString;
    }

    function logBytes(bytes32 _nyuBytes) public returns (bytes32 retBytes) {
        Byteslog(_nyuBytes);
        return _nyuBytes;
    }

    function underflow(uint _minus) public returns (uint _retNum) {
        z = z - _minus;
        return z;
    }

    function overflow(uint _plus) public returns (uint _retNum) {
        z = z + _plus;
        return z;
    }

    function safeSub(uint p, uint q) internal pure returns (uint retNum) {
        require(q <= p);
        return (q - p);
    }

    function dontUnderflow(uint _minus) public returns (uint retNum) {
        z = safeSub(z, _minus);
        return z;
    }

}