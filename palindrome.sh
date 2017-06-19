#!/usr/bin/env bash

#script name    : palindrome.sh
#title          : Palindrome Checker
#description    : Determine if string argument is a palindrome.
#author         : Srishti Belwariar
#date           : 02/10/2017
#usage          : ./palindrome.sh [word]
#notes          :
#   Word argument must be a string.  Though it is expected the string
#	only contains letters, the script still accepts numbers and 
#	as part of the argument.
#   Some valid commands:
#	$ ./palindrome.sh mirror
#	$ ./palindrome.sh 12klnonlk21
#	$ ./palindrome.sh sd2dsf32
#bash_version   : 3.2.57(1)-release

#============================================================================

reverse=$(echo $1 | rev)
if [ $1 = $reverse ];
then echo "$1 is a palindrome."
else echo "$1 is not a palindrome."
fi
