#!/bin/bash

USERID=$(id -u)
#echo "$USERID" Checking whether it is printing 0 or not , Don't need to pring

LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"
TIMESTAMP=$( date "+%Y-%m-%d %H:%M:%S")


if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access ..."
    exit 1
fi

#first argument is what are you trying ot install
#secong arg -> exit code

VALIDATE(){
        if [ $2 -ne 0 ]; then
        echo " $TIMESTAMP [ERROR] Installing $1 is Failed ..."         | tee -a $LOGS_FILE

        else
            echo " $TIMESTAMP [INFO] Installed $1  Successfully ..."    | tee -a $LOGS_FILE
        fi

}


for package in $@ 
do 
    echo "Installing $package"
    dnf list instlled $package
    if [ $? -ne 0 ]; then
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE " $TIMESTAMP installing $package " $?
    else
        echo " $TIMESTAMP $package already installed ... SKIPPING"

    fi
done