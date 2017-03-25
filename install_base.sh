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

# Set a few variables
DEST_ROOT='/dev/sdb1'                             ##   Set the "/" ROOT drive/partition to format.
DEST_HOME=''                                      ## Set the HOME drive/partition to format. ALSO uncomment mount line below.
DEST_SWAP='/dev/sdb2'                             ## Set the SWAP drive/partion to initialze.
PACFILES='base base-devel memtest86+ git lynx samba'  ## need to test if lynx and samba can be used at this stage. if not, remove.

# Begin system prep
timedatectl set-ntp true                          ## turn on network time sync

# format partitions
printf "Formating ROOT partition...\n"
mkfs.ext4 $DEST_ROOT                              ## format drive with ext4
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
echo                                                         ## needed for new line
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
printf "Press any key to continue\n"
read -n1 -r
echo                                                         ## needed for new line

# chroot into new system
printf "Time to enter the new system to finish setup...\n"
printf "CHROOTing into the new system (notice the new prompt)...\n"
arch-chroot /mnt /bin/bash
