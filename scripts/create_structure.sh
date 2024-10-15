#!/bin/bash

# Change to the project root directory
cd "$(dirname "$0")/.." || exit

# Log file
LOG_FILE="create_structure.log"
echo "Starting directory creation..." > "$LOG_FILE"

# Define the base directory for the project as the root, allowing custom paths
BASE_DIR=${1:-"../solidity_dev_templates"}
echo "Base directory: $BASE_DIR" >> "$LOG_FILE"

# Function to create directories and log success or error
create_directory() {
  local DIR=$1
  mkdir -p "$DIR" && echo "Created $DIR" >> "$LOG_FILE" || { echo "Failed to create $DIR" | tee -a "$LOG_FILE"; exit 1; }
}

# Function to create files and populate basic content
create_file() {
  local FILE=$1
  local CONTENT=$2
  [ ! -f "$FILE" ] && echo "$CONTENT" > "$FILE" && echo "Created $FILE" >> "$LOG_FILE" || echo "Skipped $FILE, already exists" >> "$LOG_FILE"
}

# Create directories in parallel
create_directory "$BASE_DIR/ci" &
create_directory "$BASE_DIR/contracts/token_standards" &
create_directory "$BASE_DIR/contracts/modular_extensions" &
create_directory "$BASE_DIR/contracts/financial_instruments" &
create_directory "$BASE_DIR/projects" &
create_directory "$BASE_DIR/documentation" &
create_directory "$BASE_DIR/frontend/public" &
create_directory "$BASE_DIR/frontend/src/components" &
create_directory "$BASE_DIR/frontend/src/utils" &
create_directory "$BASE_DIR/scripts" &
create_directory "$BASE_DIR/third_party/blockchain" &
create_directory "$BASE_DIR/third_party/fiat_currency" &
create_directory "$BASE_DIR/third_party/ai" &
create_directory "$BASE_DIR/third_party/cross_chain" &
create_directory "$BASE_DIR/third_party/cloud" &
create_directory "$BASE_DIR/third_party/domains" &
create_directory "$BASE_DIR/third_party/data_feeds" &
create_directory "$BASE_DIR/third_party/payments" &
create_directory "$BASE_DIR/third_party/open_banking" &
create_directory "$BASE_DIR/tests/gas_optimization_tests" &
create_directory "$BASE_DIR/tests/integration_tests" &
create_directory "$BASE_DIR/tests/security_tests" &
create_directory "$BASE_DIR/tests/unit_tests" &
create_directory "$BASE_DIR/utils" &
wait

# Create key files with default content
create_file "$BASE_DIR/LICENSE.md" "License details go here."
create_file "$BASE_DIR/README.md" "# Project Title\nThis project is structured with token standards, third-party integrations, and testing modules."
create_file "$BASE_DIR/TODO.md" "# TODO List\n- Complete setup for all token standards and integrations."

# Dynamic lists for ERC standards, ISO standards, tokenized financial instruments, and third-party services
ERC_STANDARDS=("ERC-20" "ERC-721" "ERC-777" "ERC-1155" "ERC-2535" "IERC" "ERC-4626" "ERC-1363" "ERC-1400" "ERC-998")
ISO_STANDARDS=("ISO_20022" "ISO_4217" "ISO_10962" "ISO_17442" "ISO_8583" "ISO_27001" "ISO_29115" "ISO_29100" "ISO_18013" "ISO_13616" "ISO_9362" "ISO_10383" "ISO_6166" "ISO_15022" "ISO_7812" "ISO_7816")
TOKENIZED_INSTRUMENTS=("EquityTokens" "DebtTokens" "RealEstateTokens" "CommodityTokens" "FundTokens" "Bonds" "MTNs" "LTNs" "CDs" "LedgerDeposits" "OtherInstruments")
THIRD_PARTY_SERVICES=("wagmi" "wallet_connect" "consensys_linea" "consensys_quorum" "layerzero_bridge" "synapse_protocol" "allbridge" "hop_protocol" "plaid" "yodlee" "open_bank_project" "decentro" "tink")

# Create directories and README.md files for ERC standards
for STANDARD in "${ERC_STANDARDS[@]}"; do
  DIR_NAME=$(echo "$STANDARD" | tr -d '[:punct:]' | tr ' ' '_')
  create_directory "$BASE_DIR/contracts/token_standards/$DIR_NAME"
  create_file "$BASE_DIR/contracts/token_standards/$DIR_NAME/README.md" "# $STANDARD Token Standard\nDescription and implementation details for $STANDARD."
done

# Create directories and README.md files for ISO standards
for STANDARD in "${ISO_STANDARDS[@]}"; do
  create_directory "$BASE_DIR/standards/$STANDARD"
  create_file "$BASE_DIR/standards/$STANDARD/README.md" "# $STANDARD\nISO Standard for $STANDARD."
done

# Create directories and README.md files for tokenized financial instruments
for INSTRUMENT in "${TOKENIZED_INSTRUMENTS[@]}"; do
  create_directory "$BASE_DIR/templates/$INSTRUMENT"
  create_file "$BASE_DIR/templates/$INSTRUMENT/README.md" "# $INSTRUMENT\nDetails on $INSTRUMENT tokenization."
done

# Create directories for third-party integrations and README.md files
for SERVICE in "${THIRD_PARTY_SERVICES[@]}"; do
  create_directory "$BASE_DIR/third_party/blockchain/$SERVICE"
  create_file "$BASE_DIR/third_party/blockchain/$SERVICE/README.md" "# $SERVICE Integration\nInstructions and setup details for $SERVICE."
done

# Create directories for governance facets and other modular extensions
FACETS_DIR="$BASE_DIR/contracts/modular_extensions/ERC-2535/facets"
create_directory "$FACETS_DIR"
touch "$FACETS_DIR/ownershipFacet.sol" "$FACETS_DIR/governanceFacet.sol" "$FACETS_DIR/multiSigWalletFacet.sol" \
      "$FACETS_DIR/quadraticVotingFacet.sol" "$FACETS_DIR/snapshotVotingFacet.sol" "$FACETS_DIR/reputationVotingFacet.sol" \
      "$FACETS_DIR/treasuryFacet.sol" "$FACETS_DIR/interoperabilityFacet.sol" "$FACETS_DIR/roleManagementFacet.sol" \
      "$FACETS_DIR/upgradeFacet.sol" && echo "Facet files created" >> "$LOG_FILE"
create_file "$FACETS_DIR/README.md" "# ERC-2535 Facets\nDescription of each facet and its role."

# Automate testing setup
create_directory "$BASE_DIR/tests/gas_optimization_tests"
create_directory "$BASE_DIR/tests/integration_tests"
create_directory "$BASE_DIR/tests/security_tests"
create_directory "$BASE_DIR/tests/unit_tests"
create_file "$BASE_DIR/tests/unit_tests/test_erc20.js" "// Unit test for ERC-20 contract"

# Create GitHub workflow files for CI/CD integration
create_directory "$BASE_DIR/.github/workflows"
create_file "$BASE_DIR/.github/workflows/ci.yml" "name: CI Workflow\non: [push]\njobs:\n  build:\n    runs-on: ubuntu-latest"

# Initialize Git repository and make initial commit
if [ ! -d "$BASE_DIR/.git" ]; then
  git init "$BASE_DIR" && cd "$BASE_DIR" && git add . && git commit -m "Initial structure created"
  echo "Git repository initialized and initial commit made." >> "$LOG_FILE"
fi

echo "All necessary directories and files have been created based on the updated file tree structure." | tee -a "$LOG_FILE"