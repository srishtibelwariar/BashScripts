#!/usr/bin/env bash

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
