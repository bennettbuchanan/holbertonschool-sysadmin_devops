#!/bin/bash
rem=$(( $1 % 2 ))

if [ $rem -eq 0 ]
then
  echo "Heh?"
else
  echo "Sleep time!"
fi
