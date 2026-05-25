#!/bin/bash
USERID=$(id -u)

#checking the root access or not
if [ "$USERID" -ne 0 ]; then
    echo "Please run this script with root access !!!"
    exit 1
fi

# echo "I'm continuing ..." 
dnf list installed mysql # here we are cheking the Mysql is installed or not

if [ $? -ne 0 ] ; then # if the process is not equal to 0 , It means already installed
    echo "Mysql is already installed ... SKIPPING"
else # If the process is 0 , Now it will Install the Mysql
    echo "Installing MySql"
    dnf install mysql -y

    if [ $? -ne 0 ]; then
        echo "Installing MySql is FAILED ..."
    else
        echo "Installing MySql is SUCCESS ..."
    fi
fi
