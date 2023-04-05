#!/bin/bash
function testing() {
    read -p "Enter the first number: " NUM1
    read -p "Enter the Second number: " NUM2
    NEWNUM=$(($NUM1 + $NUM2))
    echo "The New Number is $NEWNUM"  #without this we will not see output on screen
    return ${NEWNUM}
}
testing()