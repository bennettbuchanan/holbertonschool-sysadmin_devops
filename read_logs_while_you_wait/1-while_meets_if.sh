#!/bin/bash
FILE=$1
while read line; do
    if [[ $line == *"HEAD"* ]]
    then
	echo "$line"
    fi
done < $FILE
