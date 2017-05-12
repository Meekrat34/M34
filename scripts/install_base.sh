#!/bin/bash
#
# Clear the screen to start fresh
clear
# This is the first script to pre the system for base install
#
# NOTE: You must partition your drive yourself. I believe there
#         is too much room for error and/or damage to data to
#         script in drive partitioning.
#
# Load variables from settings file
#
if [ -f "./settings.conf" ]; then
      source settings.conf; else
      printf "Settings file not found"; exit
fi


# Begin system prep
timedatectl set-ntp true                          ## turn on network time sync

PAUSEME
printf "The next step will format $DEST_ROOT and $DEST_SWAP. Are you ready?\n"
printf "If yes, did you partion the drive first?\n"

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
printf "Downloading and installing base packages onto new filesystem...\n"
pacstrap /mnt $PACFILES
echo
printf " If there are ANY errors, exit and fix them now\n"
echo
PAUSEME
echo
#
# need an errorcheck to exit if pacstrap fails
#
# copy scripts needed after chroot
mkdir /mnt/root/bin
cp -r /root/M34-master/* /mnt/root/bin
# create fstab file
printf "Generating new fstab in /mnt/etc/fstab...\n"
genfstab -L -p /mnt >> /mnt/etc/fstab
cat /mnt/etc/fstab
echo
printf "Review the fstab BEFORE contiuing...\n"
echo
PAUSEME
echo                                                         ## needed for new line

# chroot into new system
printf "Time to enter the new system to finish setup...\n"
printf "CHROOTing into the new system (notice the new prompt)...\n"
arch-chroot /mnt /bin/bash
