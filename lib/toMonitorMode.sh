#!/bin/bash

INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`

if [ "$INT" = "" ]
then
	echo "no wlan interface detected"
else
	echo "wireless interface found: $INT"
	echo "placing into monitor mode"
	airmon-ng start $INT
	MON_INT=`ifconfig | grep "wlan" | cut -d ":" -f 1`
	echo $MON_INT
	echo "removing from monitorm mode"
	airmon-ng stop $MON_INT
fi


