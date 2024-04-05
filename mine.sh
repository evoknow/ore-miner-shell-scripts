#!/bin/bash

source config.sh

while true; do

    echo "Running ORE on $HOST for $HOME";

    $ORE --rpc $RPC --keypair $KEYPAIR --priority-fee $FEES mine --threads $THREADS </dev/null >/dev/null 2>&1

done
