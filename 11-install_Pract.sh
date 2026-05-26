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

dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "MySql already installed ... SKIPPING"
else 
    echo "installing Mysql"
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE MySql $?
fi

dnf list installed nginx &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "nginx already installed ... SKIPPING"
else 
    echo "installing nginx"
    dnf install nginx -y &>> $LOGS_FILE
    VALIDATE nginx $?
fi
