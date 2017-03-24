#!/bin/bash
#
# This is the first script to pre the system for base install
#
# NOTE: You must partition your drive yourself. I believe there
#         is too much room for error and/or damage to data to
#         script in drive partitioning.
#

# Set a few variables
DEST_ROOT='/dev/sdb1'                             ##   Set the "/" ROOT drive/partition to format.
DEST_HOME=''                                      ## Set the HOME drive/partition to format. ALSO uncomment mount line below.
DEST_SWAP='/dev/sdb2'                             ## Set the SWAP drive/partion to initialze.
PACFILES='base base-devel git lynx samba'
LOC_GEN='en_US.UTF-8 UTF-8'                       ## Set your locale if you know it.
LOC_CONF='en_US.UTF-8'
HOSTNAME='Arch'
GROUPS='wheel,users,video,audio'
SHELL='/bin/bash'
USERNAME='dave'



# Begin system prep
timedatectl set-ntp true                          ## turn on network time sync

# format partitions
printf "Formating ROOT partition...\n"
mkfs.ext4 $DEST_ROOT                              ## format drive with ext4
resize2fs -s $DEST_ROOT                           ## uncomment this line if using syslinux to boot, this disables the 64bit
printf "Initializing swap partition...\n"
mkswap $DEST_SWAP                                 ## initialize swap
swapon

# mount new filesystem
printf "Mounting the new filesystem..\n"
mount $DEST_ROOT /mnt
#mount $DEST_HOME /mnt/home

# get base files onto new filesystem
printf "Download and install base packages onto new filesystem...\n"
pacstrap /mnt $PACFILES
echo
printf " If there are ANY errors, exit and fix them now\n"
echo
printf "Press any key to continue or Ctrl+C to Exit\n"
echo
read -n1 -r
echo // needed for new line
#
# need an errorcheck to exit if pacstrap fails
#
# create fstab file
printf "Generating new fstab in /mnt/etc/fstab...\n"
genfstab -L -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
echo
printf "Review the fstab BEFORE contiuing...\n"
echo
printf "Press any key to continue\n"
read -n1 -r
echo // needed for new line

# chroot into new system
printf "Time to enter the new system to finish setup...\n"
printf " CHROOTing into the new system (notice the new prompt)...\n"
arch-chroot /mnt /bin/bash

# update pacman database
printf "Creating the pacman database...\n"
pacman -Syy

# install git
# pacman -S git lynx samba  // not enough freespace

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
