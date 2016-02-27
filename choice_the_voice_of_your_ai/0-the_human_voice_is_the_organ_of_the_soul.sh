#!/bin/bash

FIRSTWORD=$(echo $1 | awk '{print $1;}')
FIRSTWORD+=.m4a

case "$2" in
	f)
		say -o $FIRSTWORD -v Ting-Ting $1
		;;
	m)
		say -o $FIRSTWORD -v Ralph $1
		;;
	x)
		say -o $FIRSTWORD -v Trinoids $1
		;;
	*)
esac

ssh admin@158.69.92.186
scp ./$FIRSTWORD admin@158.69.92.186:/var/www/html/

echo "Listen to the message on" $3"/"$FIRSTWORD 