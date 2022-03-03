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
	
fi
