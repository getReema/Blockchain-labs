pragma solidity 0.8.17;
contract Bank{

uint counter;
uint numberOfAdmin;
mapping(address=> uint) public accountToBalance; //account address to itsBalance
mapping(address=>User) public accounts; 
mapping(address=>bool) public isRegistered;
mapping(address=>bool) public isAdmin;

struct User {
    uint id;
    address userAddress;
    UserType userType;
}

enum UserType {
    Admin,
    User
}

//register the deployer as Admin 
constructor(){
    User memory user = User(counter,msg.sender,UserType.Admin);
    accounts[msg.sender] =user;
    isAdmin[msg.sender]=true;
}

//register 
function register() public {
    require(isRegistered[msg.sender]==false,"already registered");
    counter++;
    User memory user = User(counter,msg.sender, UserType.User);
    accounts[msg.sender]= user;
    isRegistered[msg.sender]= true;
}


function promote(address _userToPromote) public {
// should take address to promote it as admin 

require(isAdmin[msg.sender]==true,"Declined, only admin can promote users");
User memory user = accounts[_userToPromote];
user.userType =UserType.Admin;
isAdmin[_userToPromote]= true;

}

    //users should be able to deposit money
    function desposit() public payable{
        accountToBalance[msg.sender] += msg.value;
    }
    //users should be able to withdraw money
    function withdraw() public payable{
        address payable withdrawTo = payable(msg.sender);
        uint amountToTransfer = accountToBalance[msg.sender];
        withdrawTo.transfer(amountToTransfer);
        accountToBalance[msg.sender]=0;

       // accountToBalance[msg.sender] = accountToBalance[msg.sender] - msg.value;
  }

    //get the balance of the contract 
    function getBalance() public returns (uint) {
        return accountToBalance[msg.sender];
    }

//promote to an admin 
//only admins can promote 
//registers the first admin 
   // function promote() public {
// how to know if there is any admin yet?
//is it registered

//if(numberOfAdmin==0){
   //User memory admin = User(counter,msg.sender, UserType.Admin);
   // accounts[msg.sender].UserType= UserType.Admin;
    //isAdmin[msg.sender]=true;
    //numberOfAdmin++;
    //}
    //isRegistered[msg.sender]= true;

  //  }
}
