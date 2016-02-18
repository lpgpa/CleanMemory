#!/bin/bash
# 
#
# CleanMemory.sh 
#
# Version 1.0
# Creation Date - 02/02/2009
# Updated Data  - 02/08/2016
# License: GPL
# Script to synchronize information between HD and
# Memory and after timing releases the use of memory.
#
# Author: Luis Paulo Almeida
# Email: lpgpalmeida@gmail.com
#
# To run the script just set the execute permissions:
# Chmod +x CleanMemory.sh or chmod 711 CleanMemory.sh
# But you have to be to run the system root and
# If you want to use the script in any directory for copying:
# /usr/bin with the proper execute permissions.
#
# Enter comment below with changes / corrections / improvements to the script
# Check whether the root to run the script
if [ "$(id -u)" = "0" ]		
		then
		# Free memory total Header
		echo "------------------"
		echo "Total free memory:" 
		echo "------------------"
		# Returns information direct memory used
		free -m -t | grep Mem: | cut -c37-40 
		echo "-------------------------------"
		echo "To clear memory type 'Y' or 'y'"
                echo "Do you want to clear the memory?"
		echo "or another type to exit         "
		echo "--------------------------------"
		# Get variable keyboard
		read CLEAN
		# Check if you want to clear memory with the 'Y' or 'y' runs the script	
			if  test $CLEAN == "Y" -o $CLEAN == "y"
				then
					echo "--------------------------------------------------------"
					echo "Synchronizing data between memory and HD ... please wait"
					echo "--------------------------------------------------------"
					# Command to synchronize memory data with HD, if not used the sync is possible loss of memory data to HD
					sync 
					echo "--------------------------------------"
					echo "Synchronized data ... clearing memory."
					# Area of memory being cleaned
					echo 3 > /proc/sys/vm/drop_caches
					echo "--------------------------------------"
					echo "Total free memory"
					echo "--------------------------------------"
					free -m -t
					echo
				else
					echo "-----------------------------------------------------------------------"
				        echo "You typed out $CLEAN! To run the script use Y or y - Tks you for using!"
					echo "-----------------------------------------------------------------------"

				fi
					
		else
			echo Please dear user log in as root or sudo command
fi
