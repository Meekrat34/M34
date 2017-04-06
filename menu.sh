#!/bin/bash
#
# Lets' check for the setting.conf file. Going to kind of need it
#
if [ -f "./settings.conf" ]; then
      source settings.conf; else
      printf "Settings file not found"; exit
fi

#
choice=0

while [ $choice -ne 9 ]
do

clear

echo;echo;echo;echo;echo;
echo "                ###############################################"
echo "                # Choose a script to run from the list below: #"
echo "                #                                             #"
echo "                # 1) Partition Hard Drive                     #"
echo "                # 2) Open settings.conf for review            #"
echo "                # 3) Install base system ( partition first )  #"
echo "                # 4) Finish base install  ( In CHRoot )       #"
echo "                # 5) Install Bootloader  ( syslinux )         #"
echo "                # 6) Install packages in new system           #"
echo "                # 7)                                          #"
echo "                # 8) Show Settings                            #"
echo "                # 9) QUIT                                     #"
echo "                #                                             #"
echo "                ###############################################"
echo;echo;echo;
echo -n "                Selection: "
read choice

case "$choice" in
 1 ) cgdisk  ;;
 2 ) nano ./settings.conf ;;
 3 ) ./scripts/install_base.sh ;;
 4 ) ./scripts/install_newroot.sh ;;
 5 ) ./scripts/install_syslinux.sh ;;
 6 ) ./scripts/install_packages.sh ;;
 8 ) ./scripts/showme.sh ;;
 9 ) clear; exit 1 ;;
esac

done
