#Check if given user exists
#!/bin/bash
USERNAME=$1
EXUSER=$(cat /etc/passwd | grep -i ${USERNAME} | cut -d ':' -f 1)
if [ " ${USERNAME}" = "${EXUSER}"]; then
    echo "'User exist, please select a new user name."
else 
    echo "'User Dont exist, Lets create user $USERNAME"
fi