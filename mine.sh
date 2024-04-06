#!/bin/bash

source config.sh

timeout_count=0

while true; do

    echo "$timeout_count running $ORE on $HOST";


    if [[ $DEBUG -eq 1 ]]; then

       #$ORE --rpc $RPC --keypair $KEYPAIR --priority-fee $FEES mine --threads $THREADS | egrep -v '(Confirms|Attempt|Sending)'
       timeout 60 $ORE --rpc $RPC --keypair $KEYPAIR --priority-fee $FEES mine --threads 8 | egrep -v '(Confirms|Attempt|Sending)'

    else

       $ORE --rpc $RPC --keypair $KEYPAIR --priority-fee $FEES mine --threads $THREADS </dev/null >/dev/null 2>&1

    fi

    # Check if the last command (timeout) returned 124, indicating a timeout occurred

    if [ $? -eq 124 ]; then
        ((timeout_count++))
        echo "ORE timed out $timeout_count times."
    fi



done
