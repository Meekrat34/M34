#!/bin/bash
#
# WOOT WOOT WOOT
#
clear   ## I love to start with a clean screen, don't you?
#
# If you are here then you have a bootable system....
#                     ..... with network
#                           ..... no errors
#                                 ..... a nice lean,clean linux machine.
# 
# Sooooo, Let us load some variables
if [ -f "./settings.conf" ]; then
      source settings.conf; else
      printf "Settings file not found"; exit
fi
#
echo
ping -c 3 www.google.com
echo
printf "Make sure you can ping the internet"
echo
PAUSEME
echo
UPDPAC            # update pacman database

# And now, let's fatten it up a bit shall we
#pacman -S $COMBINE_THEM
pacman -S $COMM $CODEC $XTRA $UTILS $PAC_A


# vlc for command line? research this
#
# Verify the names of the following. caps, spelling, special symbols, etc. They MUST be excact or they will fail.
# ddrescue-gui = defunct
PAUSEME


