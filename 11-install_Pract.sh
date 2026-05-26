USERID=$(id -u)
LOGS_DIR=/home/ec2-user/shell-logs
LOGS_FILE="$LOGS_DIR/$0.log" #/home/ec2-user/shell-logs/11-install_Pract.sh.log
if [ "$USERID" -ne 0 ]; then
    echon "Please run this command with root access ..."
    exit 1
fi

VALIDATE(){
    if [ $2 -eq 0 ]; then
        echo "Installing $1 Failed ...."
    else
        echo "Installed $1 SUCCESSFULLY"
    fi

}
dnf list installed mysql &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "Its already installed ... SKIPPING"
else 
    echo "installing Mysql"
    dnf install mysql -y &>> $LOGS_FILE
    VALIDATE MySql $!
fi

dnf list installed nginx &>> $LOGS_FILE
if [ $? -eq 0 ]; then
    echo "$1 already installed ... SKIPPING"
else 
    echo "installing $1"
    dnf install $1 -y &>> $LOGS_FILE
    VALIDATE nginx $!
fi
