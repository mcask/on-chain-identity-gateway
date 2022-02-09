# usage 
# scripts/deploy_gkn.sh testnet prod

set -e
set -u

# integration-test, casper-test, mainnet
CHAIN=$1
# prod, dev
STAGE=$2

if [[ $CHAIN == "casper-test" ]]; then
  echo "Deploying to casper-test"
  NODE="http://138.201.54.44:7777"
elif [[ $CHAIN == "mainnet" ]]; then
  echo "Deploying to mainnet"
  NODE="http://3.14.161.135:7777"
else
  echo "Deploying to integration-test"
  NODE="http://3.140.179.157:7777"
fi

casper-client put-deploy \
--chain-name "$CHAIN" \
--node-address $NODE \
--secret-key "$HOME/.config/casper/keys/${STAGE}/gatekeeper_network_authority/secret_key.pem" \
--session-path ./civic-token.wasm \
--payment-amount 150000000000