#!/bin/bash

STRING=$(tail -n $1 .output.txt | egrep "Battery"
echo "\n"
tail -n $1 .output.txt | egrep "Altitude"
echo "\n"
tail -n $1 .output.txt | egrep "Pitch"
echo "\n"
tail -n $1 .output.txt | egrep "Roll"
echo "\n"
tail -n $1 .output.txt | egrep "Yaw"
echo "\n")

echo -e $STRING > .currentValues.txt
cat .currentValues.txt | sed 's/^[ \t]*//;s/[ \t]*$//' > final.py

if [ `wc -l .output.txt | cut -d " " -f 1` -gt 25 ]
then
	echo "" > .output.txt
	tail -n $1 .currentValues.txt > .output.txt
fi
