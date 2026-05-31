#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${2:-14}

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]
    echo "Either source directory or destination directory empty"
    echo "USAGE :: $0 [source_fir] [dest_dir] [days:default 14]"
    exit 0
fi
if [ -d "$SOURCE_DIR" ]; then
    echo "Directory exists."
else
    echo "Directory does NOT exist."
fi

if [ -d "$DEST_DIR" ]; then
    echo "Directory exists."
else
    echo "Directory does NOT exist."
fi