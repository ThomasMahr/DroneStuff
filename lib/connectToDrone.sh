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
	INT=`cat .ints.txt | cut -d ":" -f 2 | sed -e 's/^[[:space:]]*//'`
	COUNT=`wc -l .dronesFound.txt | cut -d ' ' -f 1`
	NUM_DRONES=`expr $COUNT / 3`
	LIST_NUM=1
	echo "Listing the $NUM_DRONES drone[s] in area"
	for (( i=1; i<=$NUM_DRONES*3; i+=3 ))
	do
		ESSID="`grep -n essid .dronesFound.txt | grep "$i:" | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//'`"
		MAC="`grep -n bssid .dronesFound.txt | cut -d ":" -f 3,4,5,6,7,8 | sed -e 's/^[[:space:]]*//'`"
		echo -e "\t$LIST_NUM: $ESSID ($MAC)"
		LIST_NUM=`expr $LIST_NUM + 1`
	done
	read -p "Select a drone ESSID to target: " TARGET_NUM
	LINE=$((`expr $TARGET_NUM \* 3` - 2))
	TARGET_ESSID=`grep -n essid .dronesFound.txt | grep "$LINE:" | cut -d ":" -f 3 | sed -e 's/^[[:space:]]*//'`
	LINE=$((`expr $TARGET_NUM \* 3` - 1))
	TARGET_MAC=`grep -n bssid .dronesFound.txt | grep "$LINE:" | cut -d ":" -f 3,4,5,6,7,8 | sed -e 's/^[[:space:]]*//'`

	echo -e "Associating with ${GREEN}$TARGET_ESSID${NO_COLOR} over ${YELLOW}$INT${NO_COLOR}"

	#Disabling NetworkManager to make sure we have full control of wireless interface
	systemctl stop NetworkManager
	
	#Associating with AP
	iwconfig $INT essid $TARGET_ESSID
	iwconfig $INT ap $TARGET_MAC
	iwconfig $INT enc off
	dhclient $INT

fi



#echo "Associating with AP over wlan1"
#wpa_supplicant -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlan1 -B

#echo "Getting IP"
#dhclient wlan1

#./intsDown.sh
