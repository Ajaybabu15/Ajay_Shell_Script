#!/bin/bash
USERS=$@
if [ $# -gt 0 ]
then
    for USERNAME in ${USERS}
    do
      if [ [ $USERNAME =~ ^[a-zA-Z ]+$  ] ]
      then
          #if [ [ $USERNAME =~ ^[a-zA-Z ] ] ]
          #then
          EXUSER=$(cat /etc/passwd | grep -i ${USERNAME} | cut -d ':' -f 1)
          if [ ""${USERNAME}"" = ""${EXUSER}"" ];then
              echo ""'User exist, please select a new user name.""
          else
              SPEC=$(echo '!@#$%^&*()_' | fold -w1 | shuf | head -1)
              PASSWORD=India@${RANDOM}${SPEC}
              echo "Lets Create User $USERNAME"
              useradd -m $USERNAME  
              echo "${$USERNAME}:${PASSWORD}" | sudo chpasswd 
              passwd -e ${USERNAME}
              echo ""User is $USERNAME created and password is $PASSWORD""
           fi
       else
           echo "INVALID INPUT"    
       fi
    done
else
    echo "Provid Some Input as You have given $# parms"
fi