#!/bin/bash

# Add repositories, update and upgrade, install apps, themes, tweaks, uninstall and clean

clear

# Colors
	if [ $(tput colors) ]; then
		normal="\e[0;37m"
		title="\e[1;37m"
		green="\e[0;32m"
		red="\e[0;31m"
	fi

# Distro detection
	#distro=$(lsb_release -c | cut -f2)
	#targetDistro=trusty
	#if [ "$distro" != "$targetDistro" ]; then
	#	printf "\n$red Wrong Distribution! $normal \n"
	#	printf " Your distro is$title $distro$normal. But this script was made for$title $targetDistro$normal.\n\n"
	#	exit 1
	#fi

# Title
	printf "\n$title Install'n'tweak script $normal \n"
	printf " ____________________________________ \n\n"
	sleep 1

# Root rights
	printf " The script needs sudo rights. "
	sudo -s<<SCRIPT
	printf "$green OK $normal \n\n"

# REPOSITORIES
	printf " Adding repos..."
	(
		# Chrome
			wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
			echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
		# Atom
			apt-add-repository ppa:webupd8team/atom -y
		# Arc theme
			sh -c "echo 'deb http://download.opensuse.org/repositories/home:/Horst3180/xUbuntu_15.10/ /' >> /etc/apt/sources.list.d/arc-theme.list"
			wget http://download.opensuse.org/repositories/home:Horst3180/xUbuntu_15.10/Release.key
			apt-key add - < Release.key
		# Paper theme & icons
			add-apt-repository ppa:snwh/pulp -y
	) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";

# Update app list
	printf " Updating..."
	(
		apt-get update
	) &> /dev/null && printf "$green OK $normal \n\n" && notify-send "Damn cool script" "Repos added. System updated." || printf "$red FAILED $normal \n\n";

# APPLICATIONS
	printf " Installing: \n"
	printf "    Atom..." && ( apt-get -y install atom ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Blender..." && ( apt-get -y install blender ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Caffeine..." && ( apt-get -y install caffeine ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Chrome..." && ( apt-get install google-chrome-stable -y ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Disks..." && ( apt-get -y install gnome-disk-utility ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Docker..." && ( apt-get -y install docker.io ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Double Commander..." && ( apt-get -y install doublecmd-common ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    FileZilla..." && ( apt-get -y install filezilla ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Firefox..." && ( apt-get -y install firefox ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    gitg..." && ( apt-get -y install gitg ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    GParted..." && ( apt-get -y install gparted ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Image Viewer..." && ( apt-get -y install gpicview ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Inkscape..." && ( apt-get -y install inkscape ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Intel Graphic Driver..." && ( apt-get -y install xserver-xorg-video-intel ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Midori..." && ( apt-get -y install midori ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Multimedia codecs..." && ( apt-get -y install libavcodec-extra ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Plank..." && ( apt-get -y install plank ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    PlayOnLinux..." && ( apt-get -y install playonlinux ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Power Statistics..." && ( apt-get -y install gnome-power-manager ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    SmartGit..." && ( wget -O ~/Downloads/smartgit.deb http://www.syntevo.com/downloads/smartgit/smartgit-7_0_3.deb && dpkg -i smartgit.deb ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Startup Disk Creator..." && ( apt-get -y install usb-creator-gtk ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Synaptic..." && ( apt-get -y install synaptic ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    System Monitor..." && ( apt-get -y install gnome-system-monitor ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    System Profiler and Benchmark..." && ( apt-get -y install hardinfo ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Transmission..." && ( apt-get -y install transmission-gtk ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    VirtualBox..." && ( apt-get -y install virtualbox-qt ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Viber..." && ( wget -O ~/Downloads/viber.deb http://download.cdn.viber.com/cdn/desktop/Linux/viber.deb && dpkg -i viber.deb ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    VLC..." && ( apt-get -y install vlc ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "\n"

# TWEAKS
	printf " Tweaks: \n"
	printf "    Ubuntu Restricted Extra..." && 	(
		echo ttf-mscorefonts-installer msttcorefonts/accepted-mscorefonts-eula select true | debconf-set-selections
		apt-get install ttf-mscorefonts-installer -y
		apt-get install ubuntu-restricted-addons -y
		apt-get install gstreamer0.10-plugins-bad-multiverse -y
		apt-get install libavcodec-extra-53 -y
		apt-get install unrar -y
	) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Rar archives support..." && ( apt-get -y install rar ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Remote control from mobile..." && ( apt-get -y install openssh-server xdotool ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "\n"

# THEMES
	printf " Themes: \n"
	printf "    Paper theme..." && ( apt-get install -y paper-gtk-theme ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Paper icons..." && ( apt-get install -y paper-icon-theme ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Arc theme..." && ( apt-get install arc-theme ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "\n"

# UNINSTALL
	printf " Uninstall: \n"
	printf "    Pidgin..." && (  apt-get -y remove --purge pidgin ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "    Thunderbird..." && (  apt-get -y remove --purge thunderbird ) &> /dev/null && printf "$green OK $normal \n" || printf "$red FAILED $normal \n";
	printf "\n"

# Upgrade
	printf " Upgrading..."
	(
		apt-get -y upgrade
	) &> /dev/null && printf "$green OK $normal \n" && notify-send "Damn cool script" "System is up to date now." || printf "$red FAILED $normal \n";

# Clean
	printf " Cleaning up..."
	(
		apt-get -y autoremove
		apt-get -y autoclean
		apt-get -y clean
	) &> /dev/null && printf "$green OK $normal \n\n" || printf "$red FAILED $normal \n\n";


# Reboot
	printf " Rebooting in 10 seconds.$title CTRL+C$normal to cancel. \n\n"
	sleep 10
	shutdown -r now

SCRIPT

# Notification
	notify-send "Cool script" "It's finished, dude!"
	exit 0
