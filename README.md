# TokenSale Smart Contract

## Overview
The TokenSale smart contract is designed to manage the sale and buyback of tokens in a decentralized manner on the Ethereum blockchain. The contract allows users to purchase tokens using Ether and also sell back their tokens to the contract under certain conditions.

#  Features
- Token Purchase: Users can buy tokens if they provide sufficient Ether.
- Token Balance Management: The contract keeps track of the balance of tokens for each user.
- Token Buyback: Users can sell their tokens back to the contract, subject to a minimum sell amount condition.
  
# Contract Details
##  State Variables
- uint public _total_supply: Total supply of tokens available for sale.
- address[] public addr: List of addresses that have purchased tokens.
- address owner: The owner of the contract, set to the deployer's address.
- uint public _TokenPrice: Price of one token in Ether.
- mapping(address => uint) public balanceOf: Mapping of user addresses to their token balances.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., Avalanche_1.sol). Copy and paste the following code into the file:

```solidity
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.4" (or another compatible version), and then click on the "Compile Avalanche_1.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Avalanche_1" contract from the dropdown menu, and then click on the "Deploy" button.


## Authors

shreyas s  
[shreyas1665@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
