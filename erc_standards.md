# ERC Standards

Ethereum Request for Comments (ERC) standards define a set of rules and guidelines for creating and managing tokens on the Ethereum blockchain. These standards ensure interoperability and compatibility across different applications and smart contracts.

## ERC-20: Fungible Token Standard

The ERC-20 standard is the most widely used token standard on Ethereum, defining a common interface for fungible tokens. These tokens are interchangeable and have the same value, much like traditional currencies.

### Key Features of ERC-20

- **Transferability**: Allows tokens to be transferred between accounts.
- **Balance Inquiry**: Enables checking the balance of any account.
- **Approval and Allowance**: Allows a third party to spend tokens on behalf of the token holder.

- [Official ERC-20 Documentation](https://eips.ethereum.org/EIPS/eip-20)
- [OpenZeppelin ERC-20 Documentation](https://docs.openzeppelin.com/contracts/4.x/erc20)

## ERC-721: Non-Fungible Token (NFT) Standard

ERC-721 is the standard for non-fungible tokens, which are unique and indivisible. Each token has a distinct value and cannot be exchanged on a one-to-one basis with another ERC-721 token.

### Key Features of ERC-721

- **Unique Tokens**: Each token has a unique identifier.
- **Ownership Tracking**: Provides a standardized way to track and transfer ownership.
- **Metadata**: Supports additional metadata for each token, such as images or descriptions.

- [Official ERC-721 Documentation](https://eips.ethereum.org/EIPS/eip-721)
- [OpenZeppelin ERC-721 Documentation](https://docs.openzeppelin.com/contracts/4.x/erc721)

## ERC-777: Advanced Token Standard

ERC-777 improves upon ERC-20 by introducing advanced features like hooks, which allow for more complex interactions and better interoperability with other smart contracts.

### Key Features of ERC-777

- **Hooks**: Enable custom logic to be executed during token transfers.
- **Backward Compatibility**: Compatible with ERC-20, allowing existing ERC-20 tokens to be upgraded.
- **Operator Management**: Allows operators to manage tokens on behalf of the token holder.

- [Official ERC-777 Documentation](https://eips.ethereum.org/EIPS/eip-777)
- [OpenZeppelin ERC-777 Documentation](https://docs.openzeppelin.com/contracts/4.x/erc777)

## ERC-1155: Multi-Token Standard

ERC-1155 is a versatile standard that enables the creation of both fungible and non-fungible tokens within a single contract. This standard is particularly efficient for batch transfers and reduces the need for deploying multiple contracts.

### Key Features

- **Batch Transfers**: Allows multiple token types to be transferred in a single transaction, improving efficiency.
- **Reduced Gas Costs**: More gas-efficient compared to deploying separate ERC-20 or ERC-721 contracts for different token types.
- **Flexible Token Types**: Supports the creation and management of both fungible and non-fungible tokens within the same contract.

### Documentation

- [Official ERC-1155 Documentation](https://eips.ethereum.org/EIPS/eip-1155)
- [OpenZeppelin ERC-1155 Documentation](https://docs.openzeppelin.com/contracts/4.x/erc1155)

### Overview

The ERC-1155 standard's ability to handle both fungible and non-fungible tokens within a single contract makes it a powerful tool for developers. Its support for batch transfers and reduced gas costs further enhances its utility and efficiency.

## ERC-2535: Diamond Standard

ERC-2535, also known as the Diamond Standard, allows for modular smart contract design. It enables a single contract to have multiple facets, each with its own set of functions, facilitating upgradability and modularity.

### Key Features of ERC-2535

- **Modular Design**: Contracts can be split into multiple facets, each handling different functionalities.
- **Upgradability**: Facets can be added, replaced, or removed without redeploying the entire contract.
- **Efficient Storage**: Shares storage across facets, reducing redundancy.

- [Official ERC-2535 Documentation](https://eips.ethereum.org/EIPS/eip-2535)

## IERC Standards

The IERC standards define interfaces for the above ERCs, ensuring that contracts implementing these standards adhere to a common set of functions and events. This includes:

- `IERC20`
- `IERC721`
- `IERC777`
- `IERC1155`

- [OpenZeppelin IERC Documentation](https://docs.openzeppelin.com/contracts/4.x/api/token)

## Financial ERC Token Additions

These are additional standards and extensions that enhance the functionality of financial tokens:

### ERC-4626: Tokenized Vault Standard

A standard for tokenized vaults, providing a common interface for yield-bearing vaults.

- [Official ERC-4626 Documentation](https://eips.ethereum.org/EIPS/eip-4626)
- [OpenZeppelin ERC-4626 Documentation](https://docs.openzeppelin.com/contracts/4.x/erc4626)

### ERC-1363: Payable Token Standard

An extension of ERC-20 that allows for token transfers and approvals to be handled in a single transaction.

- [Official ERC-1363 Documentation](https://eips.ethereum.org/EIPS/eip-1363)

### ERC-1400: Security Token Standard

A standard for security tokens, incorporating features like partitioning and transfer restrictions.

- [Official ERC-1400 Documentation](https://eips.ethereum.org/EIPS/eip-1400)

## Meta Token Standards

Meta token standards are designed to enhance and extend the functionality of existing token standards, providing additional features and capabilities.

### ERC-998: Composable Non-Fungible Token Standard

ERC-998 allows non-fungible tokens to own other non-fungible tokens and fungible tokens, enabling complex asset structures.

- [Official ERC-998 Documentation](https://eips.ethereum.org/EIPS/eip-998)

By adhering to these standards, developers can ensure compatibility and interoperability within the Ethereum ecosystem, facilitating the creation of robust and secure decentralized applications.
