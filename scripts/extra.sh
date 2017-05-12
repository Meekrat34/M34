#!/bin/bash

##
##
##  Install some extra software. Not everybody wants this stuff
##
if [ -f "../settings.conf" ]; then
  source settings.conf; else
  printf "Settings file not found"; exit
##
mkdir git
cd git
git clone https:// aur.archlinux.org/package-query.git
git clone https://aur.archlinux.org/yaourt.git
cd yaourt
makepkg -si
cd ..
cd package-query
makepkg -si
echo
printf "If no errors, you shoulr now have Yaourt!!!!!"
#
pacinst alsa-utils

