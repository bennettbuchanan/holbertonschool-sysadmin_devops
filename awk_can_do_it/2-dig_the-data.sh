#!/bin/bash
cat $1 | awk '{count[$1," ", $9]++} END {for(i in count) print count[i], i}' | sort -g