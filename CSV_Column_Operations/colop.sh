#!/usr/bin/env bash
#title          : colop.sh
#description    : This bash script can be used to add, multiply, subtract, or divide 
#                 specific column values in each row and input the solutions for 
#                 each row into a new Sol.txt file.
#author         : Srishti Belwariar
#date           : 03/23/2017  
#usage          : ./colop.sh [CSVFileName] [operationcode] [columnnumber] [columnnumber] ... 
#notes          : 
#   CSV file must be a valid existing file, preferably in same directory as script
#   operation codes are as follows: add for addition, sub for subtraction, 
#       mul for multiplication, and div for division
#   columnnumber represents the column index (integer), with the leftmost column having
#       an index of 1.
#   valid execution of this command means having at least four arguments, with the
#       first being the csv file name, second being the sole operation, and at least two
#       integers referring to columns in the file.  Note: more than 2 columns may be 
#       referenced in the command.
#   some valid commands, if the csv files were real:
#   $ ./colop.sh test.csv add 3 4
#   $ ./colop.sh cakesales.csv sub 4 6 2
#   $ ./colop.sh orders.csv mul 3 7 2 1 2
#   $ ./colop.sh test.csv div 3 2
#bash_version   : 3.2.57(1)-release

#============================================================================

#PC: no less than 4 arguments
#PC: first argument is file name of csv file type
#PC: oper is either add, sub, mul, div
#PC: all other inputted arguments are integers reggering to columns in file

Array=(  "$@" )
Al=( "$#" )

if [ $Al -lt 4 ]; then
echo "Not enough arguments"
exit 64
fi

if [ ! -f ${Array[0]} ]; then
echo "csv file provided does not exist"
exit 66
fi

if [ ${Array[1]} != "add" -a ${Array[1]} != "sub" -a ${Array[1]} != "mul" -a ${Array[1]} != "div" ]; then
echo "invalid operation code"
exit 69
fi

#computational work starts from here
if [ -f Sol.txt ]; then
rm -f Sol.txt
fi

#for if operation is add
if [ ${Array[1]} == "add" ]; then
while read line; do
echo "read line"
Counter=0
for (( i=2; i<$Al; i++ ))
do
X=$(echo $line | cut -d, -f ${Array[i]})
Counter=$(($Counter+$X))
done

echo $Counter >>  Sol.txt

done < "${Array[0]}"
fi


#for if operation is sub
if [ ${Array[1]} == "sub" ]; then
while read line; do
Counter=$(echo $line | cut -d, -f ${Array[2]})
for (( i=3; i<$Al; i++ ))
do
X=$(echo $line | cut -d, -f ${Array[i]})
Counter=$(($Counter-$X))
done
echo $Counter >>  Sol.txt
done < "${Array[0]}"
fi

#for if operation is mul
if [ ${Array[1]} == "mul" ]; then
while read line; do
Counter=$(echo $line | cut -d, -f ${Array[2]})
for (( i=3; i<$Al; i++ ))
do
X=$(echo $line | cut -d, -f ${Array[i]})
Counter=$(($Counter*$X))
done
echo $Counter >>  Sol.txt
done < "${Array[0]}"
fi

#for if operation is div
if [ ${Array[1]} == "div" ]; then
while read line; do
Counter=$(echo $line | cut -d, -f ${Array[2]})
for (( i=3; i<$Al; i++ ))
do
X=$(echo $line | cut -d, -f ${Array[i]})
Counter=$(($Counter/$X))
done
echo $Counter >>  Sol.txt
done < "${Array[0]}"
fi
