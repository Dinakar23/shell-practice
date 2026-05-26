#!/bin/bash

USERID=$(id -u)
#echo "$USERID" Checking whether it is printing 0 or not , Don't need to pring

LOGS_DIR=/home/ec2-user/shell-script
LOGS_FILE="$LOGS_DIR/$0.log"

if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access ..."
    exit 1
fi

VALIDATE(){
        if [ $2 -ne 0 ]; then
        echo "Installing $1 Failed ..."         | tee -a $LOGS_FILE

        else
            echo "Installed $1 Successfully ..."| tee -a $LOGS_FILE
        fi        


}

dnf list installed mysql    &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "Mysql is already installed !!!"       | tee -a $LOGS_FILE

else
    echo "Installling Mysql"
    dnf install mysql -y     &>> $LOGS_FILE
    VALIDATE MYSQL $?
    
fi


dnf list installed nginx    &>> $LOGS_FILE

if [ $? -eq 0 ]; then
    echo "Nginx is already installed..."        | tee -a $LOGS_FILE

else
    echo "Installing Nginx"
    dnf install nginx -y    &>> $LOGS_FILE
    VALIDATE nginx $?
fi