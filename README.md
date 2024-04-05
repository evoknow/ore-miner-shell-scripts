# ore-miner-shell-scripts

## Purpose
To make it easy to manage ore mining, claiming and monitoring


## Installation
1. Download source

2. Rename directory created by git to ore
   $ mv ore-miner-shell-scripts ore

3. Change directory to ore. 
   $ cd ore

4. Change permissions to run the scripts
   $ chmod +x *.sh manage

5. If you are using custom Helius RPC, follow the Custom Helius RPC section below before continuing

6. Run manage
   $ ./manage 

7. To check status of  what is running:
   $ ./manage --status

8. To kill all processes
   $ ./manage --kill

## Monitoring
Currently the monitoring tool pushes data to my personal website.
https://mjkabir.com/orectrl/report

I will change this in the future.



## Custom Helius RPC
Keep your custom Helius RPC key in your own .zshrc .bashrc or whatever shell you use
and export it in your .[zsh|bash]rc file as:

export RPC_API_KEY=your-private API for the RPC

Example:
export RPC_API_KEY=dxxxxxxx-a555-4999-8AAAA-34444444
