#!/bin/bash

# Make swapfile (8 Gb) in root /

clear

# Colors
	if [ $(tput colors) ]; then
		normal="\e[0;37m"
		title="\e[1;37m"
		green="\e[0;32m"
		red="\e[0;31m"
	fi

# Title
	printf "\n$title Swap file making script $normal \n"
	printf " ____________________________________ \n\n"
	sleep 1

# Root rights
	printf " The script needs sudo rights. "
	sudo -s<<SCRIPT
	printf "$green OK $normal \n\n"


# SWAP
	printf " Generating swap file..."
	printf "    Creating dump file of 8 Gb..." && ( dd if=/dev/zero of=/swapfile bs=1k count=8192k ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Setting rights..." && ( chmod 600 /swapfile ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Making swap..." && ( mkswap /swapfile ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Setting swap on..." && ( swapon /swapfile ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Writing to fstab..." && ( sh -c 'echo "/swapfile   none    swap    sw    0   0" >> /etc/fstab' ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";

	printf "\n Done!"

SCRIPT

# Notification
	notify-send "Cool script" "It's finished, dude!"
	exit 0
