#!/bin/bash

node navdataTest.js > output.txt &

while :
do
	clear
	echo "`tail -n 2 output.txt | egrep "battery"`"
	echo "`tail -n 2 output.txt | egrep "pitch"`"
	sleep 1
done



#watch tail -n 2 output.txt
