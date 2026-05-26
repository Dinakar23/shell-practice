#!/bin/bash

USERID=$(id -u)
echo "$USERID"

if [ $? -ne 0 ]; then
    echo "Please run this command with root access ..."
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "Mysql is already installed !!!"

else
    echo "Installling Mysql"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "Installing Failed ..."

    else
        echo "Installed Successfully ..."
    fi
fi