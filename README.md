# ERC20 Token Contract

## Overview
This repository contains a custom implementation of an ERC20 token written in Solidity without using OpenZeppelin libraries. The contract includes fundamental ERC20 functionalities such as token transfers, approvals, and allowances, making it a great learning resource for blockchain developers.

## What is an ERC20 Token?
ERC20 is a widely adopted token standard on the Ethereum blockchain that defines a set of rules for fungible tokens. It enables seamless interaction between different tokens and smart contracts, ensuring compatibility across decentralized applications (dApps).

## Use Cases
- **Cryptocurrency & Utility Tokens**: Many cryptocurrencies, such as USDT and DAI, are ERC20-based.
- **Fundraising & ICOs**: ERC20 tokens are used for Initial Coin Offerings (ICOs) and crowdfunding.
- **Decentralized Finance (DeFi)**: Many DeFi platforms utilize ERC20 tokens for lending, staking, and yield farming.
- **Gaming & NFTs**: ERC20 tokens serve as in-game currencies in blockchain-based games.

## Example dApps Using ERC20 Tokens
- **Uniswap**: A decentralized exchange for ERC20 tokens.
- **Compound**: A DeFi lending platform.
- **Aave**: A decentralized lending protocol.

## Features of This ERC20 Implementation
✅ Transfer tokens between accounts
✅ Approve spending on behalf of a user
✅ Allowance mechanism for delegated transfers
✅ Event emission for key actions (transfer, approval)

## Smart Contract Code
The contract implements the ERC20 standard without relying on OpenZeppelin. Below is a simplified breakdown:

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CustomERC20 {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    event Transfer(address indexed from, address indexed to, uint256 value);
    event Approval(address indexed owner, address indexed spender, uint256 value);

    constructor(string memory _name, string memory _symbol, uint8 _decimals, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        decimals = _decimals;
        totalSupply = _initialSupply * 10 ** uint256(decimals);
        balanceOf[msg.sender] = totalSupply;
        emit Transfer(address(0), msg.sender, totalSupply);
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool success) {
        allowance[msg.sender][_spender] = _value;
        emit Approval(msg.sender, _spender, _value);
        return true;
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[_from] >= _value, "Insufficient balance");
        require(allowance[_from][msg.sender] >= _value, "Allowance exceeded");
        
        balanceOf[_from] -= _value;
        balanceOf[_to] += _value;
        allowance[_from][msg.sender] -= _value;
        
        emit Transfer(_from, _to, _value);
        return true;
    }
}
```

## How to Deploy
1. Clone the repository:
   ```sh
   git clone https://github.com/Ebukamoses/ERC20-Token.git
   cd ERC20-Token
   ```

2. Compile the contract using Hardhat:
   ```sh
   npx hardhat compile
   ```

3. Deploy the contract to a local test network or Ethereum:
   ```sh
   npx hardhat run scripts/deploy.js --network localhost
   ```

## Testing
To test the ERC20 implementation, run:
```sh
npx hardhat test
```

## License
This project is not licensed .

## Contributions
Feel free to fork the repository and submit pull requests! 🚀
