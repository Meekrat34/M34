#!/bin/bash

clear                             ## Let's start with a clear screen

# Now let's define some variables
LOC_GEN='en_US.UTF-8 UTF-8'                       ## Set your locale if you know it.
LOC_CONF='en_US.UTF-8'
HOSTNAME='Arch'
GROUPS='wheel,users,video,audio'
SHELL='/bin/bash'
USERNAME='dave'
BOOTLDR='syslinux'                                ## choose your bootloader. DOWNLOAD ONLY. Install will be later.


# update pacman database
printf "Creating the pacman database...\n"
pacman -Syy

# Download the bootloader chosen
printf "Downloading the chosen Bootloader...$BOOTLDR\n"
pacman -S $BOOTLDR

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
passwd

# create a user
printf "Now lets create that user...\n"
printf "Creating" $USERNAME " at this time...\n"
useradd --create-home --groups $GROUPS --shell $SHELL $USERNAME
printf "User needs a password also...\n"
passwd $USERNAME
echo
echo
echo " You will need to edit your HOSTS file to add your hostname"
echo " If no errors, then you need to install your BOOTLOADER ( grub or syslinux )
echo
echo " NOTE: syslinux needs line uncommented after formating the partition, "
echo "            look for the ...resize -s... line above."
echo
echo
