#!/bin/bash

MON_INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`

BAD='\033[1;31m'
GOOD='\033[1;32m'
NO_COLOR='\033[0m'

if [ "$MON_INT" = "" ]
then
	echo -e "${BAD}No monitor interface detected${NO_COLOR}"
	echo "None" > .ints.txt
else
	#Comment out if you do not wish to remove auto-connect for other networks
	#Change to remvoe specific network connections
	rm /etc/NetworkManager/system-connections/* &> /dev/null


	echo -e "Monitor interface found: ${GOOD}$MON_INT${NO_COLOR}"
	echo "Placing into managed mode"
	airmon-ng stop $MON_INT &> /dev/null
	sleep 2
	INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`
	echo -e "Managed interface: ${GOOD}$INT${NO_COLOR}"
	echo "Man: $INT" > .ints.txt
fi

