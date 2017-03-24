#!/bin/bash
#
clear   ## start with a clean screen
#
# This is the syslinux install for my system
# Your system may be totally different
#
# This only run the Arch created script. Its here as a reminder
#     on how its run and what to do.
#
# -i copies ALL the c32 files into the /boot/syslinux folder
# -a makes partition bootable
# -m copies the binary file into the mbr
#
#
syslinux-install_update -i -a -m
echo
printf "Again, if there are any errors then fix and rerun.\n"
printf " If not then edit /boot/syslinux/syslinux.cfg to your flavor\n"
echo
