#!/bin/bash

debug() {

    if [ "$DEBUG" == "1" ]; then

        echo "$1"  
    fi
}

export DEBUG=1
export DIR=$HOME
export HOST=`hostname`;

# export RPC=https://api.mainnet-beta.solana.com

if [ -n "$RPC_API_KEY" ]; then

    export RPC=https://mainnet.helius-rpc.com/?api-key=$RPC_API_KEY
    debug "Using helius-rpc with your private RPC key"

else

    export RPC=https://api.mainnet-beta.solana.com
    debug "Using default RPC"
fi


export FEES=1000000
export KEYPAIR=$HOME/my-solana-wallet/my-keypair.json
export THREADS=4
export ORE=`which ore`
export SOLANA=`which solana`
