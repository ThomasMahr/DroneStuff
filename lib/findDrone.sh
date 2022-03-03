#!/bin/bash

RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
NO_COLOR='\033[0m'

./toMonitorMode.sh
if [ `cat .ints.txt | cut -d ":" -f 2` = "None" ]
then
	exit
else
	echo "Searching for Drone AP"
	MON_INT=`cat .ints.txt | cut -d ":" -f 2`

	airodump-ng $MON_INT --output-format csv -w test &> /dev/null &
	RPID=$!
	sleep 15
	kill $RPID

	DRONE_APS=`cat test-01.csv | grep -E '90:3A:E6|00:12:1C|90:03:B7|A0:14:3D|00:26:7E' | cut -d , -f 14`

	rm .dronesFound.txt

	if [ $DRONE_APS != "" ]
	then
		for drone in $DRONE_APS
		do
			echo -e "${YELLOW}essid: $drone${NO_COLOR}" >> .dronesFound.txt
			echo -e "\t${GREEN}chanel: `cat test-01.csv | grep -E $drone | cut -d , -f 4`${NO_COLOR}" >> .dronesFound.txt
			echo -e "\t${GREEN}bssid: `cat test-01.csv | grep -E $drone | cut -d , -f 1`${NO_COLOR}" >> .dronesFound.txt
		done
	fi

	cat .dronesFound.txt

	rm test-01.csv
	./toManagedMode.sh
fi
