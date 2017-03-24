# README

This is a collection of personal scripts for my Arch system. They are written with my system in mind.
But feel free to use them. If you have an idea to improve on them let me know.

I am new to git, so please be patient with me.

I have them broken down in sections. Each file has variables at the beggining.
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
    - This simple is a reminder file as Arch has a wonderfull script I would not dream of touching.

install_packages
    - Post install script to install some good software based on the need of the system.
