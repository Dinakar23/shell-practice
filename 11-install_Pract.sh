USERID=$(id -u)

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
dnf list installed mysql
if [ $? -eq 0 ]; then
    echo "Its already installed ... SKIPPING"
else 
    echo "installing Mysql"
    dnf install mysql -y
    VALIDATE MySql $2
fi

dnf list installed nginx
if [ $? -eq 0 ]; then
    echo "$1 already installed ... SKIPPING"
else 
    echo "installing $1"
    dnf install $1 -y
    VALIDATE nginx $2
fi
