#!/bin/bash

source config.sh

while true; do

    # Capture the output of the rewards command
    REWARDS=$($ORE --rpc $RPC --keypair $KEYPAIR --priority-fee $FEES rewards)

    # Check if rewards are "0 ORE"
    if [[ "$REWARDS_OUTPUT" != *"0 ORE"* ]]; then
        echo "Trying to claim: $REWARDS..."
        $ORE --rpc $RPC --keypair $KEYPAIR --priority-fee $FEES claim  | grep -i 'landed';
    else
        echo "No rewards to claim."
    fi

    sleep 1
done
