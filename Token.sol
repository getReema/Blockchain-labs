pragma solidity ^0.8.17;

contract Token {
    // ERC -20
    string _name;
    string _symbol;
    uint _totalSupply; //so we will know the 
    address owner;
    //
    mapping(address =>uint) balances;

    constructor(string memory name, string memory symbol,uint _supply){
        _name = name;
        _symbol= symbol;
        balances[msg.sender]= _supply;
        _totalSupply= _supply;
        owner= msg.sender;
    }

    //mint function 
    //two
    //mint tokens and change the total supply and the the balances mapping 
    //only the owner can mint 
  
  // Sends an amount of newly created coins to an address
    // Can only be called by the contract creator
    function mint(address receiver, uint amount) public {
        require(msg.sender == owner,"only owner can mint");
        _totalSupply +=amount;
        balances[receiver] += amount;
    }


    //burn 
    //two
    //remove tokens from a person
    // removed the , uint amount
    function burn(uint amount) public {
        //totalSupply -=amount;
        require(balances[msg.sender]>= amount,"Not enough tokens to burn");
        _totalSupply-=amount;
       // balances[receiver] +=  balances[msg.sender];
        balances[msg.sender] -=amount;
    }


    //transfer functions 
    //token transfer 
    //two
    //only the owner of the tokens can send them to someone else 
 // Sends an amount of existing coins
    // from any caller to an address
    function transfer(address receiver, uint amount) public {
        require(amount<= balances[msg.sender],"you don't have that much to transfer ");
        //require
        require(receiver != address(0),"sending to the zero address is not allowed");
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
       
    }


    //getters
    //like this one
     function name() public view returns (string memory) {
        return _name;
    }
      function symbol() public view returns (string memory) {
        return _symbol;
    }
      function totalSupply() public view returns (uint) {
        return _totalSupply;
    }
    function getBalance() public view returns(uint){
        return balances[ msg.sender];
    }

       function getBalance(address _address) public view returns(uint){
        return balances[_address];
    }

}
