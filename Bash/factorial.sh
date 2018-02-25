#!/bin/bash
factorial=1
for ((i=1; i<=$1; i++))
do
  let "factorial *= i" 
done
echo "$1! = $factorial"
