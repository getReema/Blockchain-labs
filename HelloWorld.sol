pragma solidity 0.8.17;
contract HelloWorld{
    string public word= "Hello Reema";// state 
    address owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; // it's not a string, no need for qutation
    bool isMe ; //default is false
    mapping(address=> uint256) balances;
}
