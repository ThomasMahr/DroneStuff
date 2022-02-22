#!/bin/bash

INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`

if [ "$INT" = "" ]
then
	echo "No wlan interface detected"
else
	echo "Wireless interface found: $INT"
	echo "Placing into monitor mode"
	airmon-ng start $INT &> /dev/null
	MON_INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`
	echo "Monitor interface: $MON_INT"
fi

