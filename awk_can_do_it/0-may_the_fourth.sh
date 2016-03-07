#!/bin/bash
FOURTHWORD=$(echo $1 | awk '{print $4;}')
echo $FOURTHWORD