#!/bin/bash

MON_INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`

if [ "$MON_INT" = "" ]
then
	echo "No monitor interface detected"
else
	echo "Monitor interface found: $MON_INT"
	echo "Placing into managed mode"
	airmon-ng stop $MON_INT &> /dev/null
	INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`
	echo "Managed interface: $INT"
	echo "Man: $INT" > .ints.txt
fi

