#!/bin/bash

# Function to check if a command exists
command_exists() {
    command -v "$1" >/dev/null 2>&1
}

# Check for updates and upgrades
echo "Updating system..."
sudo apt update && sudo apt upgrade -y

# Check and install SSH server
if ! command_exists ssh; then
    echo "Installing OpenSSH server..."
    sudo apt install -y openssh-server
    sudo systemctl start ssh
    sudo systemctl enable ssh
else
    echo "OpenSSH server is already installed."
fi

# Check and configure firewall for SSH
if sudo ufw status | grep -q inactive; then
    echo "Configuring firewall to allow SSH..."
    sudo ufw allow ssh
    sudo ufw enable
else
    echo "Firewall is already configured for SSH."
fi

# Check and install Oracle Java
if ! java -version 2>&1 | grep -q "Java(TM) SE Runtime Environment"; then
    echo "Adding Oracle Java PPA..."
    sudo add-apt-repository -y ppa:linuxuprising/java
    sudo apt update
    echo "Installing Oracle Java..."
    sudo apt install -y oracle-java17-installer
    sudo apt install -y oracle-java17-set-default
else
    echo "Oracle Java is already installed."
fi

# Check and install NVM
if ! command_exists nvm; then
    echo "Installing NVM..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
else
    echo "NVM is already installed."
    # Ensure NVM is sourced in the current session
    export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
    [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

# Check and install Node.js (LTS)
if ! command_exists node || ! node -v | grep -q "v"; then
    echo "Installing Node.js LTS version..."
    nvm install --lts
else
    echo "Node.js is already installed."
fi

# Check and install Yarn
if ! command_exists yarn; then
    echo "Installing Yarn..."
    npm install --global yarn
else
    echo "Yarn is already installed."
fi

# Set up Hardhat project
PROJECT_DIR="my-solidity-project"
if [ ! -d "$PROJECT_DIR" ]; then
    echo "Setting up Hardhat project..."
    mkdir $PROJECT_DIR
    cd $PROJECT_DIR
    yarn init -y
    yarn add --dev hardhat
    npx hardhat
    cd ..
else
    echo "Hardhat project already exists."
fi

# Check and install OpenZeppelin Contracts
if [ ! -d "$PROJECT_DIR/node_modules/@openzeppelin" ]; then
    echo "Installing OpenZeppelin Contracts..."
    cd $PROJECT_DIR
    yarn add @openzeppelin/contracts
    cd ..
else
    echo "OpenZeppelin Contracts are already installed."
fi

# Check and install Docker Engine
if ! command_exists docker; then
    echo "Installing Docker Engine..."
    sudo apt install -y apt-transport-https ca-certificates curl software-properties-common
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
    sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    sudo apt update
    sudo apt install -y docker-ce
    sudo systemctl start docker
    sudo systemctl enable docker
else
    echo "Docker Engine is already installed."
fi

# Check and install Docker Compose plugin
if ! command_exists docker-compose; then
    echo "Installing Docker Compose plugin..."
    DOCKER_CONFIG=${DOCKER_CONFIG:-$HOME/.docker}
    mkdir -p $DOCKER_CONFIG/cli-plugins
    curl -SL https://github.com/docker/compose/releases/download/v2.0.0/docker-compose-linux-x86_64 -o $DOCKER_CONFIG/cli-plugins/docker-compose
    chmod +x $DOCKER_CONFIG/cli-plugins/docker-compose
else
    echo "Docker Compose plugin is already installed."
fi

echo "Development environment setup complete."
