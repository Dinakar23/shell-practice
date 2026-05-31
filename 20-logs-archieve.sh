#!/bin/bash

SOURCE_DIR=$1
DEST_DIR=$2
DAYS=${3:-14}

if [ -z "$SOURCE_DIR" ] || [ -z "$DEST_DIR" ]; then
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

FILES=$( find "$SOURCE_DIR" -type f -name "*.log" -mtime +$DAYS)

if [ -z "$FILES" ]; then
    echo "Log Files older than 14 days not found , nothing to do"
    exit 0
fi

# while IFS= read -r FILE
# do
#     echo "$FILE"
# done <<< "$FILES"

TIMESTAMP=$(date "+%Y-%m-%d-%H-%M-%S")
ARCHIVE_FILE="$DEST_DIR/logs-archieve-$TIMESTAMP.tar.gz"

tar -czvf "$ARCHIVE_FILE" $FILES
echo "Archive created successfully: $ARCHIVE_FILE"

if  [ $? -eq 0 ]; then
    echo "Arcieve is success, deleting the files"
    while IFS= read -r FILE
    do
        rm -f $FILE
        echo "Deleted file : $FILE"
    done <<< "$FILES"
else
    echo " ERROR :: Archieval is Failed "
    exit 1
fi

