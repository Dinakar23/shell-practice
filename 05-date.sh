#!/bin/bash

#timestamp=$(date)
#echo "today time is :$timestamp"

START_TIME=$(date +%s)
sleep 5 
END_TIME=$=(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Total time in seconds : $TOTAL_TIME"