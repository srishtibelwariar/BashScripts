#!/usr/bin/env bash
#script name    : dirdetails.sh
#title          : Root Directory Details
#description    : This bash script tells how many subdirectories and files are
#		  contained at each level in each directory.
#author         : Srishti Belwariar
#date           : 03/09/2017
#usage          : ./dirdetails.sh [./path/of/directory]
#notes          :
#   A valid command, if the script and the root directory belong in the same
#	directory:
#   $ ./colop.sh ./RootDirectory
#bash_version   : 3.2.57(1)-release

#============================================================================

#Number of subdirectories
A=($(ls | wc -c))

#Number of Total Files in root directory
B=($(find -type f -print | wc -l))



#Print Report
echo "Total Subdirectories: "A
echo "Total Files: "B

