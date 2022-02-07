#!/bin/bash

STRING=$(tail -n 4 output.txt | egrep "Battery"
echo "\n"
tail -n 4 output.txt | egrep "Pitch"
echo "\n"
tail -n 4 output.txt | egrep "Roll"
echo "\n"
tail -n 4 output.txt | egrep "Yaw"
echo "\n")

echo -e $STRING > currentValues.txt
cat currentValues.txt | sed 's/^[ \t]*//;s/[ \t]*$//' > final.py

if [ `wc -l output.txt | cut -d " " -f 1` -gt 20 ]
then
	echo "" > output.txt
fi
