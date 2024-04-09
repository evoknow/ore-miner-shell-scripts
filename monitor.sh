#!/bin/bash

source config.sh;


HOST=`hostname -s`

main() {

        DATE=`date`


	# Count the number of ore processes
	ore_process_count=$(ps auxww | grep 'ore --rpc' | grep 'mine --threads' | grep -v 'grep' | wc -l)

	# Run the ore command to get rewards and capture the output
	rewards_output=$($ORE --keypair $KEYPAIR rewards)

	# Run the ore command to get rewards and capture the output
	ore_balance=$($ORE --keypair $KEYPAIR balance)

	# Get the solana balance
	solana_balance=$($SOLANA balance --keypair $KEYPAIR)

	# Get the current datetime
	datetime=$(date '+%Y-%m-%d %H:%M:%S')
	timezone=$(date '+%Z')

	# Write the required information to /tmp/ore.log
	echo "HOST: $HOST, TZ: $timezone, DATETIME: $datetime, ORE PROCESS COUNT: $ore_process_count, REWARDS: $rewards_output, SOLANA BALANCE: $solana_balance, ORE BALANCE: $ore_balance" > /tmp/ore.log

	# URL-encode the contents of /tmp/ore.log and store the result
	encoded_data=$(perl -MURI::Escape -ne 'chomp;print uri_escape($_),"\n"' < /tmp/ore.log | tr -d '\n')

	# Format the POST data
	post_data="data=$encoded_data"

	# Use echo to pass the post data to lynx
        echo -n $post_data | lynx -mime_header -post_data -useragent="Mozilla/5.0" -nolist https://mjkabir.com/orectrl >/dev/null 2>&1

        # cat /tmp/ore.log

}

# Main loop
echo "$DATE: $HOST $HOME sending monitoring data... ";

while true; do
   main;
   sleep 60;
done
