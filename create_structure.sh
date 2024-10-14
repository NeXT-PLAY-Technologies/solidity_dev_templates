#!/bin/bash

# Log file
LOG_FILE="create_structure.log"
echo "Starting directory creation..." > "$LOG_FILE"

# Check for necessary tools
command -v zip >/dev/null 2>&1 || { echo "zip is required but not installed. Aborting." | tee -a "$LOG_FILE"; exit 1; }

# Check if the current directory is "solidity_dev_templates"
if [ "$(basename "$PWD")" == "solidity_dev_templates" ]; then
    BASE_DIR="$PWD"
else
    BASE_DIR="$PWD/solidity_dev_templates"
    mkdir -p "$BASE_DIR" || { echo "Failed to create base directory. Aborting." | tee -a "$LOG_FILE"; exit 1; }
fi

# Define the base directories relative to the base directory
CONTRACTS_DIR="$BASE_DIR/contracts"
TEMPLATES_DIR="$BASE_DIR/templates"
SRC_DIR="$BASE_DIR/src"
STANDARDS_DIR="$BASE_DIR/standards"
GOVERNANCE_DIR="$BASE_DIR/governance"
UTILS_DIR="$BASE_DIR/utils"
CI_DIR="$BASE_DIR/ci"
THIRD_PARTY_DIR="$BASE_DIR/third_party"
TESTS_DIR="$BASE_DIR/tests"
DOCUMENTATION_DIR="$BASE_DIR/documentation"
GITHUB_WORKFLOWS_DIR="$BASE_DIR/.github/workflows"

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

# List of ISO standards
ISO_STANDARDS=(
  "ISO_20022"
  "ISO_4217"
  "ISO_10962"
  "ISO_17442"
  "ISO_8583"
  "ISO_27001"
  "ISO_29115"
  "ISO_29100"
  "ISO_18013"
  "ISO_13616"
  "ISO_9362"
  "ISO_10383"
  "ISO_6166"
  "ISO_15022"
  "ISO_7812"
  "ISO_7816"
)

# List of tokenized financial instruments
TOKENIZED_INSTRUMENTS=(
  "EquityTokens"
  "DebtTokens"
  "RealEstateTokens"
  "CommodityTokens"
  "FundTokens"
  "Bonds"
  "MTNs"  # Medium-Term Notes
  "LTNs"  # Long-Term Notes
  "CDs"   # Certificates of Deposit
  "LedgerDeposits"
  "OtherInstruments"
)

# Create the base directories if they don't exist
mkdir -p "$CONTRACTS_DIR/token_standards" "$CONTRACTS_DIR/modular_extensions" "$CONTRACTS_DIR/financial_instruments" \
         "$STANDARDS_DIR" "$GOVERNANCE_DIR/modules" "$SRC_DIR/web3" "$UTILS_DIR" "$CI_DIR" "$THIRD_PARTY_DIR" \
         "$TESTS_DIR/unit_tests" "$TESTS_DIR/integration_tests" "$TESTS_DIR/security_tests" "$TESTS_DIR/gas_optimization_tests" \
         "$DOCUMENTATION_DIR" "$GITHUB_WORKFLOWS_DIR" || { echo "Failed to create one or more base directories. Aborting." | tee -a "$LOG_FILE"; exit 1; }

# Create a directory for each ERC standard in contracts, templates, and src
for STANDARD in "${ERC_STANDARDS[@]}"; do
  DIR_NAME=$(echo "$STANDARD" | tr -d '[:punct:]' | tr ' ' '_')
  
  CONTRACT_PATH="$CONTRACTS_DIR/token_standards/$DIR_NAME"
  TEMPLATE_PATH="$TEMPLATES_DIR/$DIR_NAME"
  SRC_PATH="$SRC_DIR/$DIR_NAME"
  
  mkdir -p "$CONTRACT_PATH" "$TEMPLATE_PATH" "$SRC_PATH" || { echo "Failed to create directories for $STANDARD. Aborting." | tee -a "$LOG_FILE"; exit 1; }
  echo "Created directories for $STANDARD" | tee -a "$LOG_FILE"
  
  # Create README.md in each directory
  echo "# $STANDARD" > "$CONTRACT_PATH/README.md"
  echo "# $STANDARD" > "$TEMPLATE_PATH/README.md"
  echo "# $STANDARD" > "$SRC_PATH/README.md"
done

# Create token_factory directory in templates
mkdir -p "$TEMPLATES_DIR/token_factory" || { echo "Failed to create token factory directory. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Created token factory directory" | tee -a "$LOG_FILE"
echo "# Token Factory" > "$TEMPLATES_DIR/token_factory/README.md"

# Create directories for tokenized financial instruments in templates
for INSTRUMENT in "${TOKENIZED_INSTRUMENTS[@]}"; do
  INSTRUMENT_PATH="$TEMPLATES_DIR/$INSTRUMENT"
  mkdir -p "$INSTRUMENT_PATH" || { echo "Failed to create directory for $INSTRUMENT. Aborting." | tee -a "$LOG_FILE"; exit 1; }
  echo "Created directory for $INSTRUMENT" | tee -a "$LOG_FILE"
  echo "# $INSTRUMENT" > "$INSTRUMENT_PATH/README.md"
done

# Create triangulation directory in src
mkdir -p "$SRC_DIR/triangulation" || { echo "Failed to create triangulation directory. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Created triangulation directory" | tee -a "$LOG_FILE"
echo "# Triangulation" > "$SRC_DIR/triangulation/README.md"

# Create additional directories and placeholder files
FACETS_DIR="$CONTRACTS_DIR/modular_extensions/ERC-2535/facets"
mkdir -p "$FACETS_DIR" || { echo "Failed to create facets directory. Aborting." | tee -a "$LOG_FILE"; exit 1; }
touch "$FACETS_DIR/ownershipFacet.sol" "$FACETS_DIR/governanceFacet.sol" "$FACETS_DIR/multiSigWalletFacet.sol" \
      "$FACETS_DIR/quadraticVotingFacet.sol" "$FACETS_DIR/snapshotVotingFacet.sol" "$FACETS_DIR/reputationVotingFacet.sol" \
      "$FACETS_DIR/treasuryFacet.sol" "$FACETS_DIR/interoperabilityFacet.sol" "$FACETS_DIR/roleManagementFacet.sol" \
      "$FACETS_DIR/upgradeFacet.sol" || { echo "Failed to create one or more facet files. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Created facet files" | tee -a "$LOG_FILE"
echo "# ERC-2535 Facets" > "$FACETS_DIR/README.md"

# Create governance modules
touch "$GOVERNANCE_DIR/modules/proposalModule.sol" "$GOVERNANCE_DIR/modules/votingModule.sol" \
      "$GOVERNANCE_DIR/modules/delegationModule.sol" "$GOVERNANCE_DIR/modules/quorumModule.sol" \
      "$GOVERNANCE_DIR/modules/treasuryModule.sol" "$GOVERNANCE_DIR/modules/timelockModule.sol" \
      "$GOVERNANCE_DIR/modules/auditModule.sol" || { echo "Failed to create one or more governance module files. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Created governance module files" | tee -a "$LOG_FILE"
echo "# Governance Modules" > "$GOVERNANCE_DIR/modules/README.md"

# Create ISO standards directories
for STANDARD in "${ISO_STANDARDS[@]}"; do
  mkdir -p "$STANDARDS_DIR/$STANDARD" || { echo "Failed to create directory for $STANDARD. Aborting." | tee -a "$LOG_FILE"; exit 1; }
  echo "Created directory for $STANDARD" | tee -a "$LOG_FILE"
  echo "# $STANDARD" > "$STANDARDS_DIR/$STANDARD/README.md"
done

# Create GitHub workflow files
touch "$GITHUB_WORKFLOWS_DIR/ci.yml" || { echo "Failed to create GitHub workflow file. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Created GitHub workflow file" | tee -a "$LOG_FILE"
echo "# GitHub Workflows" > "$GITHUB_WORKFLOWS_DIR/README.md"

# Create README, LICENSE, TODO, .env, .env.example, and .gitignore
touch "$BASE_DIR/README.md" "$BASE_DIR/LICENSE.md" "$BASE_DIR/TODO.md" "$BASE_DIR/.env" "$BASE_DIR/.env.example" "$BASE_DIR/.gitignore" || { echo "Failed to create one or more project files. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Created project files" | tee -a "$LOG_FILE"

# Compress the directory structure into a ZIP archive
zip -r "$BASE_DIR.zip" "$BASE_DIR" || { echo "Failed to create ZIP archive. Aborting." | tee -a "$LOG_FILE"; exit 1; }
echo "Directory structure and files have been created and compressed into $BASE_DIR.zip" | tee -a "$LOG_FILE"

# Provide summary feedback
echo "Total directories created: $(find "$BASE_DIR" -type d | wc -l)" | tee -a "$LOG_FILE"
echo "Total files created: $(find "$BASE_DIR" -type f | wc -l)" | tee -a "$LOG_FILE"
