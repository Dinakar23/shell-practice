#!/bin/bash
#for i in {1..100}
#do 
#    echo $i 
#done

USERID=$(id -u)
LOGS_DIR=/var/log/shell-script
LOGS_FILE="$LOGS_DIR/$0.log" #/home/ec2-user/shell-logs/11-install_Pract.sh.log
TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")

if [ "$USERID" -ne 0 ]; then
    echon "Please run this command with root access ..."
    exit 1
fi

VALIDATE(){
    if [ $2 -ne 0 ]; then
        echo "$TIMESTAMP [Error] Installing $1 Failed ...." | tee -a $LOGS_FILE
        exit 1
    else
        echo "$TIMESTAMP [info] Installed $1 SUCCESS ...." | tee -a $LOGS_FILE
    fi

}

for PACKAGE in $@
do
    echo "installing $PACKAGE package 
    dnf list installed $PACKAGE &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        dnf install $PACKAGE  -y &>> $LOGS_FILE
        VALIDATE "Installing $PACKAGE" $?
    else
        echo "$PACKAGE already installed ... Skipping"
    fi
done

