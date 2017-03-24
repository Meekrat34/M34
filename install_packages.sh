#!/bin/bash
#
# WOOT WOOT WOOT
#
# If you are here then you have a bootable system....
#                     ..... with network
#                           ..... no error
#                                 ..... a nice lean,clean linux machine.
# Soooo, let's fatten it up a bit shall we
#
# Common packages
COMM='mc tree git dialog openssh memtest86+ bsd-games samba cdrtools cifs-utils udiskie unrar unzip p7zip'
#
# Make a choice of packages to install.
#
# PAC_A - Nice Desktop with LXDE
# PAC_B - Simple server setup, no gui
# PAC_C - Studio type with Video, Audio, Image, and 3D model editors and DVD mastering tools
#
#
PAC_A='lxde xorg vlc'
PAC_B='tmux lynx binutils ddrescue e2fsprogs hdparm'
PAC_C='vlc gimp 3Dblender'
