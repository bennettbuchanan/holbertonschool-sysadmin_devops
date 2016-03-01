#!/bin/bash
FILE=$1
HEADCOUNT=0
GETCOUNT=0

while read line; do
    if [[ $line == *"HEAD"* ]]
    then
	((HEADCOUNT++))
    elif [[ $line == *"GET"* ]]
    then
	((GETCOUNT++))
    fi
done < $FILE

echo $HEADCOUNT
echo $GETCOUNT
