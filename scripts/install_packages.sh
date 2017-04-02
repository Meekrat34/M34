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
# Soooo, let's fatten it up a bit shall we
#
## Common packages, no matter what machine setup I build.
COMM='mc sudo tree git tig dialog tmux openssh bsd-games samba cdrtools cifs-utils udiskie unrar unzip p7zip rsync veracrypt'
#
## Codecs' for video, audio, and reading DVDs'
CODEC='a52dec faac faad2 flac jasper lame libdca libdv gst-libav libmad libmpeg2 libtheora libvorbis libxv wavpack x264 xvidcore libdvdcss libdvdread libdvdnav dvd+rw-tools dvdauthor dvgrab'
#
## Some extra programs ( not always needed )
XTRA='parted gparted ddrescue hdparm'
#
## Some utility programs ( not always needed )
UTILS='exfat-utils fuse-exfat '
#
# Make a choice of packages to install.
#
# PAC_A - Nice Desktop with LXDE
# PAC_B - Simple server setup, no gui
# PAC_C - Studio type with Video, Audio, Image, and 3D model editors and DVD mastering tools
#
PAC_A='lxde lxdm xorg vlc qt4'
PAC_B='lynx binutils e2fsprogs'
PAC_C='vlc gimp blender audacity clementine'
#
# Extra packages that I have found usefull, but not all the time
# If you don't want extra then remove variable from below
# Also change the package letter to match your ultimate desire for you machine
#

pacman -S $COMM $PAC_A $XTRA $CODEC $UTILS

# vlc for command line?
#
# Verify the names of the following. caps, spelling, special symbols, etc. They MUST be excact or they will fail.
# ddrescue-gui



