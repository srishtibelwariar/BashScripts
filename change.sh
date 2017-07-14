#!/usr/bin/env bash
#script name    : change.sh
#title          : Change Calculator
#description    : This bash script, when executed, prompts user to enter amount total and
#                 amount given to calculate change.
#author         : Srishti Belwariar
#date           : 02/15/2017
#usage          : ./change.sh

#bash_version   : 3.2.57(1)-release

#============================================================================

echo -n "Enter total amount: $"
read Amount

echo -n "Enter amount given: $"
read Given

#if [ $Amount -gt $Given ]
#then
#echo "Amount charged is greater than amount paid."
#exit
#fi


Change=$(( $Given - $Amount ))
echo "Your change is $ $Change."
