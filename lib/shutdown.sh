#!/bin/bash


nmap 192.168.1.1 -p 23 | grep telnet > /dev/null 2>&1 #puts the output to /dev/null
RC=$?

if [ $RC -eq 0 ]
then
	nc 192.168.1.1 23 < .command.txt > /dev/null 2>&1 #using .command.txt as an input to the terminal

else
	echo "telnet not found"
fi




