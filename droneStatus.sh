#!/bin/bash

tail -n 4 output.txt | egrep "Battery" > finalValues.py
tail -n 4 output.txt | egrep "Pitch" >> finalValues.py
tail -n 4 output.txt | egrep "Roll" >> finalValues.py
tail -n 4 output.txt | egrep "Yaw" >> finalValues.py
