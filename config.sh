#!/bin/bash

# Initialize DEBUG to 0
DEBUG=0

# Check if the --debug flag is passed

for arg in "$@"; do
  if [[ "$arg" == "--debug" ]]; then
    DEBUG=1
    shift
  fi
done

function find_valid_rpc() {
  for url in "$@"; do
    response=$(curl -s "$url")
    if [[ ! "$response" == *"exceeded limit for rpc"* ]]; then
      export RPC="$url"
      break
    fi
  done
}


debug() {

    if [ "$DEBUG" == "1" ]; then

        echo "$1"  
    fi
}

export MAX=5
export DEBUG=$DEBUG
export DIR=$HOME
export HOST=`hostname`;

RPC_NODES=( "https://mainnet.helius-rpc.com/?api-key=$RPC_API_KEY" "https://api.mainnet-beta.solana.com" )

find_valid_rpc "${RPC_NODES[@]}"

echo "DEBUG: $DEBUG RPC $url"

export FEES=1000000
export KEYPAIR=$HOME/my-solana-wallet/my-keypair.json
export THREADS=4
export ORE=`which ore`
export SOLANA=`which solana`

