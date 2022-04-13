#!/bin/bash

TARGET=$1

RED='\033[1;31m'
YELLOW='\033[1;33m'
GREEN='\033[1;32m'
BLUE='\033[1;34m'
NO_COLOR='\033[0m'

echo "Conducting nmap scan of target"
nmap $TARGET -p 23 -n | grep telnet > /dev/null 2>&1
RC=$?

if [ $RC -eq 0 ]
then
	nc $TARGET 23 < .geoCommand.txt > .geoData.txt
	LAT=`cat .geoData.txt | grep "latitude" | cut -d '=' -f 2`
	LONG=`cat .geoData.txt | grep "longitude" | cut -d '=' -f 2`
	echo -e "\n\tLAT: ${YELLOW}$LAT${NO_COLOR}\n\tLONG: ${YELLOW}$LONG${NO_COLOR}"
else
	echo "Telnet not found, aborting..."
fi
