#!/bin/bash
# Declare an array with 4 elements
array=( Debian Fedora SUSE Ubuntu )
# get number of elements 
echo "Array length = ${#array[@]}"
# echo "${#array[*]}" does the same 
# for loop echo's each element
# arrays are 0-based, i.e. index starts from 0
for ((i=0;i<${#array[@]};i++)); do
    echo "array[$i] = ${array[i]}"
done
echo 
# Assign a 5th element
array[4]='Madriva'
# Another way to loop through the elements
for distro in "${array[@]}"; do
    echo $distro
done
array[4]='Mint Linux'
echo 
echo "${array[@]}"
echo
echo "${array[*]}"
echo "${!array[@]}"
echo "${!array[*]}"
echo "${array[@]:2:2}"
