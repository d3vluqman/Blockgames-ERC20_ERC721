// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract OctagonToken is ERC20 {
    mapping(address => uint256) public addressToAmount;

    constructor() ERC20("Octagon Token", "GON") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function buyToken(address receiver, uint256 amount) payable public {
        uint256 tokenPrice = msg.value / 1000000000000000;        
        addressToAmount[receiver] -= tokenPrice;
        addressToAmount[msg.sender] += tokenPrice;
        _transfer(msg.sender, receiver, amount);
    }
}