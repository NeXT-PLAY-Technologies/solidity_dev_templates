# Development Environment Setup

This document outlines the steps and components required to set up a development environment for Solidity smart contracts on Ubuntu LTS 20.04. This setup includes essential tools and configurations to ensure a smooth development process.

## Components

1. **OpenSSH Server**: For remote access to the development environment.
2. **Oracle Java**: Required for certain tools and dependencies.
3. **NVM (Node Version Manager)**: To manage Node.js versions.
4. **Node.js (LTS)**: JavaScript runtime for development tools.
5. **Yarn**: Package manager for JavaScript.
6. **Hardhat**: Ethereum development environment.
7. **OpenZeppelin Contracts**: Library for secure smart contract development.
8. **Docker Engine**: Containerization platform for deploying applications.
9. **Docker Compose**: Tool for defining and running multi-container Docker applications.

## Setup Steps

1. **Update and Upgrade the System**

   Ensure your system is up to date with the latest packages and security patches.

   ```shell
   sudo apt update && sudo apt upgrade -y
   ```

2. **Install and Configure OpenSSH Server**

   Install the OpenSSH server to allow remote access to your development environment.

   ```shell
   sudo apt install -y openssh-server
   sudo systemctl start ssh
   sudo systemctl enable ssh
   ```

3. **Configure the Firewall to Allow SSH**

   Ensure that the firewall is configured to allow SSH connections.

   ```shell
   sudo ufw allow ssh
   sudo ufw enable
   ```

4. **Add Oracle Java PPA and Install Oracle Java**

   Add the Oracle Java PPA and install Oracle Java, which is required for certain development tools.

   ```shell
   sudo add-apt-repository -y ppa:linuxuprising/java
   sudo apt update
   sudo apt install -y oracle-java17-installer
   sudo apt install -y oracle-java17-set-default
   ```

5. **Install NVM and Node.js (LTS)**

   Install NVM to manage Node.js versions and then install the latest LTS version of Node.js.

   ```shell
   curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
   export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
   [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
   nvm install --lts
   ```

6. **Install Yarn**

   Yarn is a package manager for JavaScript, used to manage project dependencies.

   ```shell
   npm install --global yarn
   ```

7. **Set Up a Hardhat Project**

   Hardhat is an Ethereum development environment. Set up a new project to start developing smart contracts.

   ```shell
   mkdir my-solidity-project
   cd my-solidity-project
   yarn init -y
   yarn add --dev hardhat
   npx hardhat
   ```

8. **Install OpenZeppelin Contracts**

   OpenZeppelin Contracts is a library for secure smart contract development.

   ```shell
   cd my-solidity-project
   yarn add @openzeppelin/contracts
   ```

9. **Install Docker Engine**

   Docker Engine is used for containerizing applications, which can be useful for deploying blockchain nodes or other services.

   ```shell
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
   sudo apt update
   sudo apt install -y docker-ce
   sudo systemctl start docker
   sudo systemctl enable docker
   ```

10. **Install Docker Compose Plugin**

    Docker Compose is used to define and run multi-container Docker applications.

    ```shell
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.0.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
    ```

By following these steps, you will have a fully functional development environment for Solidity smart contracts on Ubuntu LTS 20.04, equipped with all necessary tools and configurations.
