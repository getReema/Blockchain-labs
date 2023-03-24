pragma solidity 0.8.17;
contract Counter {
    uint public counter;
    address public owner =0x5B38D...;
    mapping(address=> uint) public balances;


modifier onlyOwner() {
      require(  // require takes two paramters
            msg.sender==owner, // msg is the one who is on the From address who sent the transaction
            "You can't") ;
            _;
}

    function inc() public onlyOwner{ 
      
        counter++;
        retrive();
    }

    function dec() public onlyOwner{
        counter--;
    }

    function retrive() public returns (uint) {
        return counter;
    }

    function setBalance() public payable{
        // Update the value at this address
        require(msg.value >= 1 ether,"Declined, minmum is 1 ether");
    balances[msg.sender]+= msg.value;

    }

    function getBalance() public returns (uint) {
        return balances[msg.sender];
    }

}

