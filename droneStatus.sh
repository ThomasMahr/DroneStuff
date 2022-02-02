#!/bin/bash

node navdataTest.js > output.txt &

	tail -n 4 output.txt | egrep "battery" | > finalValues.py
	tail -n 4 output.txt | egrep "pitch" | >> finalValues.py
	tail -n 4 output.txt | egrep "roll" | >> finalValues.py
	tail -n 4 output.txt | egrep "yaw" | >> finalValues.py
	sleep 1



#watch tail -n 2 output.txt
