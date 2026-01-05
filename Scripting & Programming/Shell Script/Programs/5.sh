#! /bin/bash

# declare an array with pre-defined values 
declare -a my_data=(Learning "Bash variables" from GFG); 

# get length of the array 
arrLength=${#my_data[@]}

# print total number of elements in the array
echo "Total number of elements in array is: $arrLength"

# iterate through the array and print length of 
# each element and their values
echo "Below are the elements and their respective lengths:"
for (( i=0; i<arrLength; i++ ));
do
    echo "Element $((i+1)) is=> '${my_data[$i]}'; and its length is ${#my_data[$i]}"
done

# print the whole array at once
echo "All the elements in array : '${my_data[@]}'"