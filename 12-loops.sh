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

VALIDATE(){
        if [ $2 -ne 0 ]; then
        echo " $TIMESTAMP [ERROR] Installing $1 Failed ..."         | tee -a $LOGS_FILE

        else
            echo " $TIMESTAMP [INFO] Installed $1 Successfully ..."| tee -a $LOGS_FILE
        fi        


}

dnf list installed mysql &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo " $TIMESTAMP Mysql is already installed !!!"       | tee -a $LOGS_FILE

else
    echo "Installling Mysql"
    dnf install mysql -y  &>> $LOGS_FILE
    VALIDATE MYSQL $?
    
fi


dnf list installed nginx  &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo " $TIMESTAMP Nginx is already installed..."        | tee -a $LOGS_FILE

else
    echo " $TIMESTAMP Installing Nginx"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi