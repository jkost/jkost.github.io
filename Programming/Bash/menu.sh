#!/bin/bash
selection = ''
until [[ $selection == [12q] ]]
do
 echo "Menu"
 echo "1) Play Game"
 echo "2) See score"
 echo "q) Exit"
 read selection
done
case $selection in
  "1") echo "Game is loading..." ;;
  "2") echo "Top ten" ;;
  "q") echo "Exiting" ;;
    *) echo "Wrong choice. Try again." ;;  
esac

