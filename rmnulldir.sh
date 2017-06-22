#!/usr/bin/env bash
#script name    : rmnulldir.sh
#title          : Empty Subdirectories Remover
#description    : This bash script deletes empty subdirectories in main directory
#		  and echos number of subdirectories deleted.
#author         : Srishti Belwariar
#date           : 06/19/2017
#usage          : ./rmnulldir.sh
#notes          : This script deletes empty subdirectories within the root directory,
#                 including empty subdirectories at different depths.  Pre condition
#                 is that all directories (empty or not) must not contain spaces in
#                 their name.
#		  Script echos the number of folders deleted
#		
#		Valid commands:
#		  if script is in the same directory referenced
#			$ ./rmnulldir.sh
#bash_version   : 3.2.57(1)-release
#============================================================================

dir=($(du | cut -f2))
counter=0

for x in "${dir[@]}"
do
size=$(du -s "$x" | cut -f1)

if [ $size -eq 0 ] 
then
rmdir "$x"
#echo "$x needs to be deleted"
counter=$(($counter+1))
fi

done

echo "Deleted $counter subdirectories"

 
