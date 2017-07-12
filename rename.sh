#!/usr/bin/env bash
#script name    : rename.sh
#title          : Batch Rename
#description    : This bash script can be used to rename files of selected extensions
#                 in a root directory to the root directory's name and an incremental
#                 count.
#author         : Srishti Belwariar
#date           : 07/09/2017
#usage          : ./rename.sh [fileExtension] [fileExtension] ...
#                 ./rename.sh
#notes          :
#   This script is useful for batch renaming files in a root directory at a max depth of 0.  This script takes
#	many file extension types (.jpg, .png, .txt, etc.) as arguments.  This script will check and 
#	compile an array of all the files that hold the same extensions as the arguments
#	provided.  Then the script utilizes two pass renaming technique to rename files without using an existing filename.
#	This script mass renames files of specific file extensions (given as arguements) in a root directory.
#   If no argument is specified, all files in root directory are set for batch renaming.  
#   Otherwise only specified argument file types will be renamed
#   accordingly.
#   If root directory was named “root” and it contained only .jpg, .txt, and .pdf files, the following
#   commands
#   will result as:
#	$ ./rename.sh
#		~Will rename entire directory and echo specific number of file changes
#	$ ./rename.sh .jpg .txt
#		~Will rename only .jpg and .txt files in root
#	$ ./rename.sh .docx
#		~Will echo there are no .docx files to edit
#   some valid commands, if the csv files were real:
#   $ ./rename.sh
#   $ ./rename.sh .txt .jpg [...]
#   $ ./rename.sh .docx
#
#bash_version   : 3.2.57(1)-release

#============================================================================
ExtArray=( "$@" )
ExtArrayLength=( "$#" )
FilesArray=()
CountingArray=()

#first set up FilesArray with the correct order of files in maxdepth 0
if [ $ExtArrayLength -lt 1 ];
then
FilesArray+=($(find * -maxdepth 0 -type f |rev |sort | rev))
else
for((i=0; i<$ExtArrayLength; i++))
do
FilesArray+=($(find -f *${ExtArray[i]} 2>/dev/null))
done
fi

#store the size of the FilesArray for easy access and use
FilesArrayLength=${#FilesArray[@]}


#transition naming:  assign serial number of file as name in order to ensure no duplicates
for((i=0; i<$FilesArrayLength; i++))
do
SerialNumber=($(ls -i ${FilesArray[i]} | awk '{print $1}'))
extension=($(echo ${FilesArray[i]} | cut -d'.' -f2))
tN=$SerialNumber.$extension
mv ${FilesArray[i]} $tN
FilesArray[i]=$tN
done

#final naming: set name to be basename of directory path
D=($(basename `pwd`))
for((i=0; i<$FilesArrayLength; i++))
do
extension=($(echo ${FilesArray[i]} | cut -d'.' -f2))
fN=$D'_'$i.$extension
mv ${FilesArray[i]} $fN
done


