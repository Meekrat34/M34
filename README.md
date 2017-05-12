# README

This is a collection of personal scripts for my Arch system. They are written with my system in mind.
But feel free to use them. If you have an idea to improve on them let me know.

I am new to git, so please be patient with me.

I have them broken down in sections. Each file calls variables at the beggining from the settings.conf file.
Adjust to your system or it may(probably will) fail.

install_base
    - Starts after booting the Arch ISO
    - You MUST partition your drive on your own!!
    - wget the master branch and then unzip master.zip file. inside you will find all the scripts needed.
    - Then run this script to install all way up to chrooting in new environment

install_newroot
    - This will pick up after chrooting and will finish the install to give you a basic system.
    - You will still need a bootloader

install_syslinux
    - My choice of bootloaders.
    - This is a simple reminder file as Arch has a wonderfull script I would not dream of touching.

install_packages
    - Post install script to install some good software based on the needs/wants of the user.

settings.conf
    - Holds variables and funtions used by the other scripts

bin folder
    - This is collection of some of my files I use frequently. Saves on some typeing.
##
##

1. boot from Arch install iso
2. partition drive as desired
3. update pacman (pacman -Ssy)
4. install wget and unzip
5. wget https://github.com/Meekrat34/M34/archive/master.zip
6. unzip master.zip
7. cd M34-master
