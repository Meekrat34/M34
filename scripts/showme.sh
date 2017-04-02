#!/bin/bash
clear
if [ -f "settings.conf" ]; then
      . "./settings.conf"
fi
#
# This is only a script to show variables from settings.conf
#
# and to test some of its functions
#
echo
printf " Root = $DEST_ROOT\n"
printf " Home = $DEST_HOME\n"
printf " Swap = $DEST_SWAP\n"
echo
printf "Base package installs are -> $PACFILES\n"
echo
echo
printf " Localization is $LOC_GEN\n"
printf "            and $LOC_CONF\n"
echo
echo
printf " Hostname is $HOSTNAME\n"
printf " Groups for $USERNAME are $USERGRP\n"
printf " Chosen shell is $SHELL\n"




PAUSEME
done
