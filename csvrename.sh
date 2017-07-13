#!/usr/bin/env bash
#script name    : csvrename.sh
#title          : Batch Renaming Using CSV File Look Up
#description    : This bash script can be used to look up file names 
#		  in a CSV file of root directory and rename them to 
#		  the new name they are assigned in the CSV table.
#author         : Srishti Belwariar
#date           : 07/13/2017
#usage          : ./csvrename.sh [CSVFile]
#notes          :
#   This script is useful for batch renaming files in a root directory at 
#   a max depth of 0.  This script takes the table stored in the CSV file 
#   (which is located in the root directory as well) and looks up each
#   root directory file in the CSV file and changes their names to the 
#   new names provided.  This script requires the user to have a CSV 
#   file inside the root directory containing the files that will be renamed.
#   The CSV file should be formated so that the first column (without a header)
#   contains the current file names while the second column (without header)
#   contains the new names.  This script will echo the number of file
#   renames done as well as files that were not found in the CSV file and 
#   thus were not renamed.
#   
#   valid command, if the csv file was real:
#   $ ./csvrename.sh fileNameChanges.csv
#
#bash_version   : 3.2.57(1)-release

#============================================================================
CSV=$1
original=()
tN=()
new=()

#PC: Check if CSV file is valid
if [ ! -f $1 ];
then
echo "CSV file does not exist"
exit
fi

#set column 1 to original array
while read line;
do
original+=$(echo $line | cut -d, -f1)
done

#set column 2 to another array
while read line;
do
new+=$(echo $line | cut -d, -f1)
done

#conduct name swaps using 2 pass system

#add final name changes

#echo some results
