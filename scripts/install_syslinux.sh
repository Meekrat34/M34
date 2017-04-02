#!/bin/bash
#
clear   ## start with a clean screen
#
# This is the syslinux install for my system
# Your system may be totally different
#
# This only runs the Arch created script. 
#  Its here as a reminder on how its run and what to do.
# Set variable for your drive. ( can variables be read from another file? )
#
DEST_ROOT='/dev/sdb'                              ## root drive
BOOTLDR='syslinux gptfdisk mtools'                ## choose your bootloader. DOWNLOAD ONLY. Install will be later.
#
# Need to find a way to check for the 64bit vs 32bit instead of running this blind. But works for now.
#
resize2fs -s $DEST_ROOT                           ## uncomment this line if using syslinux to boot, this disables the 64bit
#
# Download the bootloader chosen
echo
printf "Downloading the chosen Bootloader...$BOOTLDR\n"
pacman -S $BOOTLDR
echo
# Run the script that comes with Arch
#
# ONCE AGAIN. the follow command points to the ARCH script ( which I most definitely did not write
# Credit to the person or group who did write it. Its looks fantastic.
#
# -i copies ALL the c32 files into the /boot/syslinux folder
# -a makes partition bootable
# -m copies the binary file into the mbr
##
syslinux-install_update -i -a -m
echo
printf "Again, if there are any errors then fix and rerun.\n"
printf " If no errors then edit /boot/syslinux/syslinux.cfg to your flavor\n"
printf "   And enjoy your new Arch install. There is a install_packages to help,"
printf "     get you going. Edit it BEFORE you run it."
echo
echo
