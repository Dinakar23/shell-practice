#!/bin/bash
USERID=$(id -u)
#checking the root access or not
if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access !!!"
fi

echo "I'm continuing ..." 