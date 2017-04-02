#!/bin/bash

clear                             ## Let's start with a clear screen

# Now let's define some variables
if [ -f "../settings.conf" ]
  then
      DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )
      source "$DIR/../settings.conf"
  else
      exit;
fi

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
