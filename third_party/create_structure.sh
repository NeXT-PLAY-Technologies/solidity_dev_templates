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

# Create third_party directories and files
create_directory "$BASE_DIR/third_party/ai_models/e2b_dev"
create_directory "$BASE_DIR/third_party/ai_models/huggingface"
create_directory "$BASE_DIR/third_party/ai_models/cohere"
create_directory "$BASE_DIR/third_party/ai_models/gpt_neo"
create_directory "$BASE_DIR/third_party/ai_models/langchain"
create_directory "$BASE_DIR/third_party/ai_models/assemblyai"

create_directory "$BASE_DIR/third_party/blockchain/infura"
create_directory "$BASE_DIR/third_party/blockchain/moralis"
create_directory "$BASE_DIR/third_party/blockchain/tatum"
create_directory "$BASE_DIR/third_party/blockchain/thirdweb"
create_directory "$BASE_DIR/third_party/blockchain/xinfin_xdc"
create_directory "$BASE_DIR/third_party/blockchain/hyperledger/besu"
create_directory "$BASE_DIR/third_party/blockchain/hyperledger/firefly"
create_directory "$BASE_DIR/third_party/blockchain/blockscout"
create_directory "$BASE_DIR/third_party/blockchain/web3j"
create_directory "$BASE_DIR/third_party/blockchain/wagmi"
create_directory "$BASE_DIR/third_party/blockchain/wallet_connect"
create_directory "$BASE_DIR/third_party/blockchain/consensys_linea"
create_directory "$BASE_DIR/third_party/blockchain/consensys_quorum"

create_directory "$BASE_DIR/third_party/cross_chain/layerzero_bridge"
create_directory "$BASE_DIR/third_party/cross_chain/synapse_protocol"
create_directory "$BASE_DIR/third_party/cross_chain/allbridge"
create_directory "$BASE_DIR/third_party/cross_chain/hop_protocol"

create_directory "$BASE_DIR/third_party/cloud/azure"
create_directory "$BASE_DIR/third_party/cloud/cloudflare"

create_directory "$BASE_DIR/third_party/domains/dot_box"
create_directory "$BASE_DIR/third_party/domains/ens"
create_directory "$BASE_DIR/third_party/domains/freename"

create_directory "$BASE_DIR/third_party/data_feeds/coingecko"
create_directory "$BASE_DIR/third_party/data_feeds/coinmarketcap"
create_directory "$BASE_DIR/third_party/data_feeds/api3"
create_directory "$BASE_DIR/third_party/data_feeds/protocolink"
create_directory "$BASE_DIR/third_party/data_feeds/metals-api"
create_directory "$BASE_DIR/third_party/data_feeds/solacenet-api"

create_directory "$BASE_DIR/third_party/fiat_currency/KTT"
create_directory "$BASE_DIR/third_party/fiat_currency/SwiftNet"
create_directory "$BASE_DIR/third_party/fiat_currency/SwiftCloud"
create_directory "$BASE_DIR/third_party/fiat_currency/Swift_GPI"
create_directory "$BASE_DIR/third_party/fiat_currency/US_FedWire"
create_directory "$BASE_DIR/third_party/fiat_currency/US_FedNow"
create_directory "$BASE_DIR/third_party/fiat_currency/US_Clearinghouse_RTP"
create_directory "$BASE_DIR/third_party/fiat_currency/US_Clearinghouse_ACH"
create_directory "$BASE_DIR/third_party/fiat_currency/RealTime_Gross_Settlement"
create_directory "$BASE_DIR/third_party/fiat_currency/IBAN"
create_directory "$BASE_DIR/third_party/fiat_currency/EuroClear"
create_directory "$BASE_DIR/third_party/fiat_currency/US_TreasuryDirect"
create_directory "$BASE_DIR/third_party/fiat_currency/VisaNet"
create_directory "$BASE_DIR/third_party/fiat_currency/SEPA"

create_directory "$BASE_DIR/third_party/payments/livitpay"
create_directory "$BASE_DIR/third_party/payments/ledgerhq"
create_directory "$BASE_DIR/third_party/payments/debank"
create_directory "$BASE_DIR/third_party/payments/plaid"
create_directory "$BASE_DIR/third_party/payments/yodlee"
create_directory "$BASE_DIR/third_party/payments/open_bank_project"
create_directory "$BASE_DIR/third_party/payments/decentro"
create_directory "$BASE_DIR/third_party/payments/tink"

create_directory "$BASE_DIR/third_party/open_banking/subsembly_fints"
create_directory "$BASE_DIR/third_party/open_banking/finapi"
create_directory "$BASE_DIR/third_party/open_banking/figo"
create_directory "$BASE_DIR/third_party/open_banking/open_bank_project"
create_directory "$BASE_DIR/third_party/open_banking/plaid"
create_directory "$BASE_DIR/third_party/open_banking/tink"
create_directory "$BASE_DIR/third_party/open_banking/truelayer"
create_directory "$BASE_DIR/third_party/open_banking/saltedge"
create_directory "$BASE_DIR/third_party/open_banking/nordigen"

create_directory "$BASE_DIR/third_party/gov_interfaces/cali_sos_ucc_api"
create_directory "$BASE_DIR/third_party/gov_interfaces/colo_sos_ucc_api"
create_directory "$BASE_DIR/third_party/gov_interfaces/conn_sos_ucc_api"

# Create README.md files and other necessary files in the correct directories
create_file "$BASE_DIR/third_party/README.md" "# Third-Party Services\nIntegration details for third-party APIs, SDKs, and tools."

create_file "$BASE_DIR/third_party/ai_models/README.md" "# Overview of AI tools\nContains various AI integrations."
create_file "$BASE_DIR/third_party/ai_models/e2b_dev/README.md" "# E2B AI SDK Integration\nIntegration for the e2b AI SDK."
create_file "$BASE_DIR/third_party/ai_models/e2b_dev/e2b_ai_sdk.js" "// JavaScript integration with e2b AI SDK."

# Continue with similar README.md and integration file creation for other directories

create_file "$BASE_DIR/third_party/data_feeds/metals-api/README.md" "# Metals-API Integration\nmetals_api_integration.js for metals pricing."
create_file "$BASE_DIR/third_party/data_feeds/metals-api/metals_api_integration.js" "// Metals-API integration for precious metals data."

create_file "$BASE_DIR/third_party/data_feeds/solacenet-api/README.md" "# SolaceNet API Integration\nsolacenet_api_integration.js for SolaceNet."
create_file "$BASE_DIR/third_party/data_feeds/solacenet-api/solacenet_api_integration.js" "// SolaceNet API integration."

create_file "$BASE_DIR/third_party/gov_interfaces/cali_sos_ucc_api/README.md" "# Cali SOS UCC API\nIntegration for California SOS UCC API."
create_file "$BASE_DIR/third_party/gov_interfaces/cali_sos_ucc_api/cali_sos_ucc_integration.js" "// Integration with Cali SOS UCC API."

create_file "$BASE_DIR/third_party/gov_interfaces/colo_sos_ucc_api/README.md" "# Colo SOS UCC API\nIntegration for Colorado SOS UCC API."
create_file "$BASE_DIR/third_party/gov_interfaces/colo_sos_ucc_api/colo_sos_ucc_integration.js" "// Integration with Colo SOS UCC API."

create_file "$BASE_DIR/third_party/gov_interfaces/conn_sos_ucc_api/README.md" "# Conn SOS UCC API\nIntegration for Connecticut SOS UCC API."
create_file "$BASE_DIR/third_party/gov_interfaces/conn_sos_ucc_api/conn_sos_ucc_integration.js" "// Integration with Conn SOS UCC API."

echo "All necessary directories and files for third_party have been created." | tee -a "$LOG_FILE"
