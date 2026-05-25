#!/bin/bash
USERID=$(id -u)

#checking the root access or not
if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access !!!"
    exit 1
fi

# First arg -> What are you trying to install
# second arg -> exit code

VALIDATE()={
    if [ $2 -ne 0 ]; then
        echo "Installing $1 is FAILED ..."
    else
        echo "Installing $1 is SUCCESS ..."
    fi

}

# echo "I'm continuing ..." 
dnf list installed mysql # here we are cheking the Mysql is installed or not
if [ $? -eq 0 ] ; then # if the process is not equal to 0 , It means already installed
    echo "Mysql is already installed ... SKIPPING"
else # If the process is 0 , Now it will Install the Mysql
    echo "Installing MySql"
    dnf install mysql -y
    VALIDATE MySql $!
    
fi

dnf list installed nginx # here we are cheking the Mysql is installed or not
if [ $? -eq 0 ] ; then # if the process is not equal to 0 , It means already installed
    echo "Mysql is already installed ... SKIPPING"
else # If the process is 0 , Now it will Install the Mysql
    echo "Installing nginx"
    dnf install nginx -y
    VALIDATE nginx $!
    
fi