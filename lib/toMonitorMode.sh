#!/bin/bash

INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`

BAD='\033[1;31m'
GOOD='\033[1;32m'
NO_COLOR='\033[0m'

if [ "$INT" = "" ]
then
	echo -e "${BAD}No wlan interface detected${NO_COLOR}"
	echo "None" > .ints.txt
else
	echo -e "Wireless interface found: ${GOOD}$INT${NO_COLOR}"
	echo "Placing into monitor mode"
	airmon-ng start $INT &> /dev/null
	MON_INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`
	echo -e "Monitor interface: ${GOOD}$MON_INT${NO_COLOR}"
	echo "Mon: $MON_INT" > .ints.txt
fi

