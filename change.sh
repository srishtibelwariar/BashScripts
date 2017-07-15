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

cho -n "Enter total amount: $"
read Amount

echo -n "Enter amount given: $"
read Given

if [ $(echo $Given - $Amount| bc) ]
then
echo "Amount charged is greater than amount paid."
exit
fi


Change=$(echo $Given - $Amount| bc)
echo "Your change is $ $Change."
