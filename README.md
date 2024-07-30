# Simple Blockchain Voting System

This project is a simple blockchain voting system developed to practice Solidity and the basics of Foundry. It includes tests and scripts to simplify testing using Forge and scripts for easier deployment.

## Features

- **Blockchain Voting**: Secure and transparent voting system using blockchain technology.
- **Solidity Contracts**: Smart contracts written in Solidity to manage voting.
- **Testing with Forge**: Comprehensive tests to ensure the functionality of the voting system.
- **Deployment Scripts**: Scripts to facilitate easy deployment of the contracts.

## Requirements

- [Foundry](https://github.com/gakonst/foundry) installed

## Installation

1. **Clone the repository**:
    ```sh
    git clone https://github.com/Hbuhero/blockchain-voting-system.git
    cd blockchain-voting-system
    ```

2. **Install dependencies**:
    ```sh
    foundryup
    ```

3. **Compile the contracts**:
   You can use this to check if the contracts are fine
    ```sh
    forge build
    ```
  
4. **Deploy the contract in Anvil**
   In another terminal run
   ```sh
   forge script DeployFundMe
   ```

## Testing

To run the tests, use the following command:

```sh
forge test
```

