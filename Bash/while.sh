#!/bin/bash
IFS=: 
echo "Name             Telephone"
echo "-----------------------------"
while read name phone
do
  echo $name $phone
done < $1
