#!/bin/bash
USERID=$(id -u)
echo "$USERID"
#checking the root access or not
if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access !!!"
    exit 1
fi

# echo "I'm continuing ..." 

echo "Installing MySql"
dnf install mysqlfdfs -y

echo "I'm continuing ..." 
echo "I'm still continuing ..." 