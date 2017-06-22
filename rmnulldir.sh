#!/usr/bin/env bash
#script name    : rmnulldir.sh
#title          : Empty Subdirectories Remover
#description    : This bash script deletes empty subdirectories in main directory
#		  and echos number of subdirectories deleted.
#author         : Srishti Belwariar
#date           : 06/19/2017
#usage          : ./rmnulldir.sh
#notes          : This script deletes empty subdirectories that lie within the root directory's
#		 	 first tier of subdirectories within the main directory
#		  Script echos the number of folders deleted
#		
#		Valid commands:
#		  if script is in the same directory referenced
#			$ ./rmnulldir.sh
#bash_version   : 3.2.57(1)-release
#============================================================================

dir=(*/)
counter=0

for x in "${dir[@]}";
do
size=$(du "$x" | cut -f1)

if [ $size -eq 0 ];
then 
rmdir "$x"
counter=$(($counter+1))
fi
done

echo "Deleted $counter subdirectories"

 
