# Security Tests

This directory contains security tests designed to identify vulnerabilities in the smart contracts and scripts. These tests help ensure the security and robustness of the project.

## Tools and Methodologies

- **MythX**: Static analysis for smart contracts.
- **Slither**: Static analysis framework for Solidity.
- **Echidna**: Fuzz testing for Ethereum smart contracts.

## Common Vulnerabilities

- Reentrancy
- Integer Overflow/Underflow
- Access Control Issues

## Running Security Tests

- Run MythX: `mythx analyze <contract>`
- Run Slither: `slither .`
