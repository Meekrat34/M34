#!/bin/bash

clear                             ## Let's start with a clear screen

# Now let's define some variables
LOC_GEN='en_US.UTF-8 UTF-8'                       ## Set your locale if you know it.
LOC_CONF='en_US.UTF-8'
HOSTNAME='StationNamehere'
GROUPS='wheel,users,video,audio'
SHELL='/bin/bash'
USERNAME='Usernamehere'

# update pacman database
printf "Updating the pacman database...\n"
pacman -Syy

# create locale.gen file and import
printf "Creating your locale...\n"
echo $LOC_GEN > /etc/locale.gen
echo "LANG=$LOC_CONF" > /etc/locale.conf
locale-gen

# change clock settings
printf "Setting up clock and hostname...\n"
hwclock --systohc --utc
echo $HOSTNAME > /etc/hostname

# set root password
printf "Time to create a ROOT password ( NOT USER )...\n"
echo
passwd

# create a user
printf "Now lets create that user...\n"
printf "Creating -> $USERNAME <- at this time...\n"
useradd --create-home --groups $GROUPS --shell $SHELL $USERNAME
printf "User needs a password also...\n"
echo
passwd $USERNAME
echo
echo
echo " You will need to edit your HOSTS file to add your hostname"
echo " If no errors, then you need to install your BOOTLOADER ( grub or syslinux )"
echo
echo " NOTE: syslinux needs line uncommented after formating the partition, "
echo "            look for the ...resize -s... line above."
echo
echo