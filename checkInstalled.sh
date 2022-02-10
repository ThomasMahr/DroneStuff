#!/bin/bash

NODE=0
NPM=0
NPM_AR_DRONE=0
NPM_READLINE=0
NPM_FS=0
PYTHON=0
PYTHON_REPRINT=0

BAD='\033[1;31m'
GOOD='\033[1;32m'
NO_COLOR='\033[0m'

node --version > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	NODE=1
	echo -e "${GOOD}Node.js installed${NO_COLOR}"
else
	echo -e "${BAD}Figure out how to install Node.js${NO_COLOR}"
fi

npm -v > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	NPM=1
	echo -e "${GOOD}npm installed${NO_COLOR}"
else
	echo -e "${BAD}Figure out how to install NPM${NO_COLOR}"
fi

npm list | grep ar-drone > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	NPM_AR_DRONE=1
	echo -e "${GOOD}ar-drone installed${NO_COLOR}"
else
	echo -e "${BAD}run 'npm install ar-drone'${NO_COLOR}"
fi

npm list | grep fs > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	NPM_FS=1
	echo -e "${GOOD}fs installed${NO_COLOR}"
else
	echo -e "${BAD}run 'npm install fs'${NO_COLOR}"
fi

npm list | grep readline > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	NPM_READLINE=1
	echo -e "${GOOD}readline installed${NO_COLOR}"
else
	echo -e "${BAD}run 'npm install readline'${NO_COLOR}"
fi

python3 --version > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	PYTHON=1
	echo -e "${GOOD}python3 installed${NO_COLOR}"
else
	echo -e "${BAD}You need to install python3${NO_COLOR}"
fi

pip3 list | grep reprint > /dev/null 2>&1
RC=$?
if [ $RC -eq 0 ]
then
	PYTHON_REPRINT=1
	echo -e "${GOOD}reprint python module installed${NO_COLOR}"
else
	echo -e "${BAD}run 'pip3 install reprint'${NO_COLOR}"
fi

