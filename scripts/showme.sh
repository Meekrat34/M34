#!/bin/bash
clear
if [ -f "./settings.conf" ]; then
      source "./settings.conf"; else
	source "../settings.conf"
fi
#
# Set up some colors
RED='\033[0;31m' # Red txt
GRN='\033[0;32m' # Green txt
YLW='\033[0;33m' # Yellow txt
BLUE='\033[0;34m' # Blue txt
DECO='\033[0m' # Default color

#
# This is only a script to show variables from settings.conf
#
# and to test some of its functions
#
echo
printf " Current connected drives are listed here..."
echo
lsblk
echo
#
#
printf " These are the variables in the settings.conf file. Adjust as needed."
echo
printf " Root = $DEST_ROOT\n"
printf " Home = $DEST_HOME\n"
printf " Swap = $DEST_SWAP\n"
echo
printf "Base package installs are -> (${GRN}$PACFILES${DECO})\n"
echo
printf " Localization is (${RED}$LOC_GEN${DECO}) and (${GRN}$LOC_CONF${DECO})\n"
echo
printf " Hostname is (${RED}$HOSTNAME${DECO}), Groups for (${GRN}$USERNAME${DECO}) are (${RED}$USERGRP${DECO}) 
	 Your users chosen shell is (${YLW}$SHELL${DECO})\n"
echo
printf " Current Bootloader files to download are -> (${BLUE}$BOOTLDR${DECO})\n"
echo
printf " Common packages are ${GRN}$COMM${DECO}\n"
echo
printf " Package A is ${GRN}$PAC_A${DECO}\n"
echo 
printf " Package B is ${GRN}$PAC_B${DECO}\n"
echo 
printf " Package C is ${GRN}$PAC_C${DECO}\n"
echo



PAUSEME
