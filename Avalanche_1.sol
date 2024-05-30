//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract TokenSale{
    uint public _total_supply;
    address[] public addr;
    address owner=msg.sender;
    uint public _TokenPrice;
    mapping(address=>uint)public balanceOf;
    constructor(uint totalSupply, uint Tokenprice){
        _total_supply=totalSupply;
        _TokenPrice=Tokenprice;

    }
    function purchaseToken()public payable{
        assert(_total_supply>0);
        require(msg.value>=_TokenPrice,"Insufficient");
        for(uint i=0;i<addr.length;i++){
            if(addr[i]==msg.sender){
                revert("Address has already bought Token");
            }
            
        }
        balanceOf[msg.sender]=msg.value/_TokenPrice;
        _total_supply-=msg.value/_TokenPrice;
        addr.push(msg.sender);
    }
    function sellTokenBack(uint amount)public {
        require(amount>(20*balanceOf[msg.sender])/100,"Cannot sell less than 20%");
        assert(balanceOf[msg.sender]>0);
        balanceOf[msg.sender]-=amount;
        payable(owner).transfer(amount);
    }
    

}
