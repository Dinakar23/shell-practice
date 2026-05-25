#!/bin/bash

#timestamp=$(date)
#echo "today time is :$timestamp"

# Interview Question ( how can you execute a command in shellscript and take output , could you please explain what is the question is
START_TIME=$(date +%s)
sleep 5 
END_TIME=$(date +%s)
TOTAL_TIME=$(($END_TIME-$START_TIME))
echo "Script executed in $TOTAL_TIME seconds"