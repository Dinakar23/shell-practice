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
