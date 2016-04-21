#!/bin/bash

# Mount /opt to /home

clear

# Colors
	if [ $(tput colors) ]; then
		normal="\e[0;37m"
		title="\e[1;37m"
		green="\e[0;32m"
		red="\e[0;31m"
	fi

# Title
	printf "\n$title Mount /opt to /home $normal \n"
	printf " ____________________________________ \n\n"
	sleep 1

# Root rights
	printf " The script needs sudo rights. "
	sudo -s<<SCRIPT
	printf "$green OK $normal \n\n"


# OPT TO HOME
	printf " Let's start...\n"
	printf "    Mounting..." && ( mount -o bind /home/opt /opt ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Writing to fstab..." && ( sh -c 'echo "/home/opt   /opt    none    bind    0   0" >> /etc/fstab' ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";

    printf "\n Done!"

# Reboot
	printf " Rebooting in 10 seconds.$title CTRL+C$normal to cancel. \n\n"
	sleep 10
	shutdown -r now

SCRIPT

# Notification
	notify-send "Cool script" "It's finished, dude!"
	exit 0
