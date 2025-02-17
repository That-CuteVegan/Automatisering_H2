#!/bin/bash

# Script to look in to what discs you have avilable and partition the discks in to root and swap

# Acknowlege Partitioning_Script.sh is booted
echo "Partitioning_Script.sh have booted, press enter to continue"
read

Ready=""

# Uses username to ask user if they are ready to partition their disk.
until [[ "$Ready" == "YES" || "$Ready" == "NO" ]]; do
echo "hi, $User_Name! Are you ready to partition some discs for your arch installation? YES/NO"
read Ready

# Looks at the input from the yes/no question and runs instalation if ready.
	case $Ready in

		*"YES"*)
			echo "You chose 'YES' lets get started partitioning some discs then".
			echo "Booting partitioning.sh"
			./partitioning.sh
			echo "Partitioning have finished"
			break
		;;
	
		*"NO"*)
			echo "you chose 'NO'. Exiting partitioning script."
			brake	
		;;

		*)
			echo "That input dont work please type 'YES' or 'NO'."
		;;
	esac
done