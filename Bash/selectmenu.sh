#!/bin/bash
# Prompt string for menu
PS3="Make your choice 1)Play Game 2)See score 3)Exit : "
select command in play score exit
do 
 case $command in
  play) echo "Game is loading..." ;;
  score) echo "Top ten" ;;
  exit) echo "Exiting" 
        break ;;
     *) echo "Wrong choice. Try again." ;;  
 esac
done
