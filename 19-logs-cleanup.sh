#!/bin/bash
SOURCE_DIR=$1
DAYS=${2:-14}

if [ -z $SOURCE_DIR ]; then
    ehco "ERROR :: Missing parameters"
    echo "USAGE: $0 <source-dir> [days(optinal to 14 days)]"
    exit 1
fi


if [ -d "$SOURCE_DIR" ]; then
    echo "Directory exists."
else
    echo "Directory does NOT exist."
fi

echo "Scanning $SOURCE_DIR for log files more than 14 days"
FILES=$(find "$SOURCE_DIR" -name "*.log" -type f -mtime  +"$DAYS" )

if [ -z "$FILES" ]; then
    echo "No log files older then 14 days"
    exit 0
fi
 
 while IFS= read -r LINE
 do
    echo " File to be deleted : $LINE"
    rm -f $LINE

 done <<< "$FILES"