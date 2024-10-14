# Integration Tests

This directory contains integration tests that verify the interaction between different components of the project. These tests ensure that the system works as a whole.

## Approach

- Deploy contracts to a test network.
- Simulate real-world interactions and scenarios.
- Verify the expected outcomes and state changes.

## Running Tests

- Deploy contracts: `truffle migrate --network test`
- Run integration tests: `truffle test`

## Dependencies

- Truffle
- Ganache
