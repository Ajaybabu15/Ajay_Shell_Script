#Check if user exists or not and if not avialiable create the user with a password
#!/bin/bash
USERNAME=$1
EXUSER=$(cat /etc/passwd | grep -i ${USERNAME} | cut -d ':' -f 1)
if [ "${USERNAME}" = "${EXUSER}" ];then
    echo "'User exist, please select a new user name."
else
    echo "User Dont exist, Lets create user $USERNAME"
    #useradd -m $USERNAME # Creates a user
    useradd -m -d /home/$USERNAME $USERNAME # Creates a user and adds to home directory
    SPEC='!@#$%^&*()_'
    SPECCHAR=$(echo $SPEC | fold -w1 | shuf | head -1)
    PASSWORD=India@${RANDOM}${SPECCHAR}  #create a random password with min of 8 chars and with random 3 or 4 digit number.
    echo "$USERNAME:$PASSWORD" | sudo chpasswd #Assign the password to user and force to change after first login
    echo "User $USERNAME created and password is $PASSWORD"
    passwd --expire $USERNAME
fi