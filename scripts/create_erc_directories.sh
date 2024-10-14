#!/bin/bash

# Get the directory of the current script
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Define the base directory relative to the script's directory
BASE_DIR="$SCRIPT_DIR/../src"

# List of ERC standards
ERC_STANDARDS=(
  "ERC-20"
  "ERC-721"
  "ERC-777"
  "ERC-1155"
  "ERC-2535"
  "IERC"
  "ERC-4626"
  "ERC-1363"
  "ERC-1400"
  "ERC-998"
)

# Create the base directory if it doesn't exist
mkdir -p "$BASE_DIR"

# Create a directory for each ERC standard
for STANDARD in "${ERC_STANDARDS[@]}"; do
  # Replace spaces and special characters with underscores for directory names
  DIR_NAME=$(echo "$STANDARD" | tr -d '[:punct:]' | tr ' ' '_')
  DIR_PATH="$BASE_DIR/$DIR_NAME"
  mkdir -p "$DIR_PATH"
  echo "Created directory: $DIR_PATH"
done
