#!/bin/bash

# Define base directory
BASE_DIR="token_factory_templates"

# Create the directory structure
mkdir -p $BASE_DIR/{contracts,scripts,tests,documentation,ci,utils,examples}

# Contracts - Solidity templates
cat <<EOL > $BASE_DIR/contracts/TokenFactory.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract TokenFactory {
    function createERC20(string memory name, string memory symbol, uint256 initialSupply) external returns (address) {
        // Logic to create ERC20 token
    }

    function createERC721(string memory name, string memory symbol) external returns (address) {
        // Logic to create ERC721 token
    }

    function createERC1155(string memory uri) external returns (address) {
        // Logic to create ERC1155 token
    }
}
EOL

cat <<EOL > $BASE_DIR/contracts/ERC20Template.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract ERC20Template {
    string public name;
    string public symbol;
    uint8 public decimals;
    uint256 public totalSupply;
    
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowance;

    constructor(string memory _name, string memory _symbol, uint256 _initialSupply) {
        name = _name;
        symbol = _symbol;
        totalSupply = _initialSupply;
        balanceOf[msg.sender] = _initialSupply;
    }

    // ERC-20 Functions (transfer, approve, etc.)
}
EOL

cat <<EOL > $BASE_DIR/contracts/ERC721Template.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract ERC721Template is ERC721 {
    uint256 private _tokenIds;

    constructor(string memory name, string memory symbol) ERC721(name, symbol) {}

    function mint(address recipient) public returns (uint256) {
        _tokenIds++;
        uint256 newItemId = _tokenIds;
        _mint(recipient, newItemId);
        return newItemId;
    }
}
EOL

# Add more Solidity files (ERC1155Template.sol, ERC1363Template.sol, etc.)
# You can expand this section with additional contracts as needed

# Scripts - Deployment and utility scripts
cat <<EOL > $BASE_DIR/scripts/deploy_token_factory.sh
#!/bin/bash
# Script to deploy the TokenFactory contract

npx hardhat run scripts/deploy_token_factory.js --network mainnet
EOL

cat <<EOL > $BASE_DIR/scripts/deploy_erc20_token.sh
#!/bin/bash
# Script to deploy an ERC20 token using TokenFactory

npx hardhat run scripts/deploy_erc20_token.js --network mainnet
EOL

# Add more scripts as needed

# Tests - Unit tests for the TokenFactory and tokens
cat <<EOL > $BASE_DIR/tests/test_factory.js
const { expect } = require("chai");

describe("TokenFactory", function () {
    it("Should deploy an ERC20 token", async function () {
        // Test logic for deploying ERC20
    });

    it("Should deploy an ERC721 token", async function () {
        // Test logic for deploying ERC721
    });
});
EOL

# Documentation - Guides and overviews
cat <<EOL > $BASE_DIR/documentation/factory_overview.md
# Token Factory Overview

This document provides an overview of the TokenFactory's functionality and how to use it to create various ERC-standard tokens.
EOL

cat <<EOL > $BASE_DIR/documentation/erc20_guide.md
# ERC-20 Token Guide

This guide explains how to deploy and manage ERC-20 tokens using the TokenFactory.
EOL

# CI - Continuous integration files
cat <<EOL > $BASE_DIR/ci/github_actions.yml
name: CI/CD Pipeline

on: [push]

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - name: Set up Node.js
        uses: actions/setup-node@v1
        with:
          node-version: '14'
      - run: npm install
      - run: npx hardhat test
EOL

# Utilities - Helper functions
cat <<EOL > $BASE_DIR/utils/token_helpers.js
// Helper functions for interacting with deployed tokens

function getTokenBalance(tokenAddress, userAddress) {
    // Logic to get token balance
}
EOL

# Examples - JSON configurations for deploying tokens
cat <<EOL > $BASE_DIR/examples/example_erc20.json
{
    "name": "Example Token",
    "symbol": "EXT",
    "initialSupply": 1000000
}
EOL

# README.md
cat <<EOL > $BASE_DIR/README.md
# Token Factory Templates

This directory contains templates and guides for creating ERC-standard tokens using the TokenFactory. The factory supports ERC-20, ERC-721, ERC-1155, and other token standards.
EOL

echo "Token Factory templates have been generated."
