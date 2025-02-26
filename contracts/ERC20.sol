//SPDX-Lincence-Identifier: MIT
pragma solidity 0.8.28;

contract ERC20 {
    string public name;
    string public symbol;
    uint8 public decimal;

    mapping(address => uint256) public balances;
}
