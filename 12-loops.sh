#!/bin/bash
#for i in {1..100}
#do 
#    echo $i 
#done

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" #/home/ec2-user/shell-logs/11-install_Pract.sh.log
if [ "$USERID" -ne 0 ]; then
    echon "Please run this command with root access ..."
    exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "Installing $1 Failed ...." 
        exit 1
    else
        echo "Installed $1 SUCCESSFULLY" 
    fi

}

for package in $@
do
    echo "installing $package package 
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $package  -y &>> $LOGS_FILE
        VALIDATE "Installing $package" $?
    else
        echo "$package already installed ... Skipping"
    fi
done

