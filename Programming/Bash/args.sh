#!/bin/bash
i=0
for arg in "$@"
do
  let "i+=1"
  echo "Argument $i is $arg"
done
