#!/bin/bash

USERID=$(id -u)
#echo "$USERID" Checking whether it is printing 0 or not , Don't need to pring

if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access ..."
    exit 1
fi

VALIDATE(){
        if [ $? -ne 0 ]; then
        echo "Installing $1 Failed ..."

        else
            echo "Installed $1 Successfully ..."
        fi        


}

dnf list installed mysql

if [ $? -eq 0 ]; then
    echo "Mysql is already installed !!!"

else
    echo "Installling Mysql"
    dnf install mysql -y
    VALIDATE MYSQL $?
    
fi


dnf list installed nginx

if [ $? -eq 0 ]; then
    echo "Nginx is already installed..."

else
    echo "Installing Nginx"
    dnf install nginx -y
    VALIDATE nginx $?
fi