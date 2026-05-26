USERID=$(id -u)

if [ "$USERID" -ne 0]; then
    echon "Please run this command with root access ..."
    exit 1
fi

dnf list installed mysql

if [ $? -eq 0]; then
    echo "Its already installed ... SKIPPING"
    exit 1
else 
    echo "installing Mysql"
    dnf install mysql -y

    if [ $? -ne 0]; then
        echo "Installing Failed ...."
    else
        echo "Installed  SUCCESSFULLY"
    fi
fi
