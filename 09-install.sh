#!/bin/bash
USERID=$(id -u)

#checking the root access or not
if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access !!!"
    exit 1
fi

# echo "I'm continuing ..." 

echo "Installing MySql"
dnf install mysqlfdfs -y

if [ "$USERID" -ne 0 ]; then
    echo "Installing MySql is FAILED ..."
else
    echo "Installing MySql is SUCCESS ..."
fi
