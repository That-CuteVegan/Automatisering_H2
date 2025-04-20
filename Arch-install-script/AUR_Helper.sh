#!/bin/bash

# This script is in case the user wishes to install AUR helper and further installation of AUR packages.

# Sets the variables for the script
AUR_HELPER=""

# Welcomes the user to the script
echo "AUR Helper script have booted."
echo "Welcome to the AUR Helper script, here we will go thru somewhat the same setup of instalations as in the main script,"
echo "only that it only pertain to AUR Helper programs."
echo "Press Enter when ready to start."
read

# Disclaimer.
echo "Time to install the AUR Helper first, a quick disclaimer:"
echo "AUR Helper is not supported by Arch Linux, it is a user created package helper which means use at your own risk."
echo "Should you still want to install it please Preass Enter to continue. (If not pick 'None' in choice after this)"
read

# User picks which AUR Helper they wish to install, Pikaur, Paru or both.
clear
echo "There are 2 seperate AUR Helper's, which one would you like to install?"
echo "1 - Pikaur"
echo "2 - Paru"
echo "3 - Both"
echo "4 - None"
read AUR_HELPER
case "$AUR_HELPER" in
    "1" | "Pikaur" | "pikaur")

        # User have chosen to install Pikaur.
        echo "You have chosen to install Pikaur."
        echo "Installation of Pikaur will commence, press Enter when ready."
        read
        echo "Installing base-devel and git."
        sudo pacman -Sy --noconfirm --needed base-devel git
        cd ~
        echo "Uses git to clone Pikaur repo."
        git clone https://aur.archlinux.org/pikaur.git
        cd pikaur
        makepkg -fsri --noconfirm
        cd ..
        rm -rf pikaur
        echo "Pikaur have sucessfully installed."
        echo "Press Enter to continue."
        read
    ;;
    
    "2" | "Paru" | "paru")

        # User have chosen to install Paru.
        echo "You have chosen to install Paru."
        echo "Installation of Paru will commence, press Enter when ready."
        read
        echo "Installing base-devel and git."
        sudo pacman -Sy --noconfirm --needed base-devel git
        cd ~
        echo "Uses git to clone Paru repo."
        git clone https://aur.archlinux.org/paru.git
        cd paru
        export PACMAN="pacman --noconfirm"
        makepkg -sri --noconfirm
        cd ..
        rm -rf paru
        echo "Paru have sucessfully installed."
        echo "Press Enter to continue."
        read
    ;;

    "3" | "Both" | "both")

        # User have chosen to install both AUR Helper's.
        echo "You have chosen to want to install both AUR Helper's."
        echo "Installation of Pikaur and Paru will commence, press Enter when ready."
        read
        echo "Installing base-devel and git."
        sudo pacman -Sy --noconfirm --needed base-devel git
        cd ~
        echo "Uses git to clone Pikaur repo."
        git clone https://aur.archlinux.org/pikaur.git
        cd pikaur
        makepkg -fsri --noconfirm
        cd ..
        rm -rf pikaur
        echo "Uses git to clone Paru repo."
        git clone https://aur.archlinux.org/paru.git
        cd paru
        export PACMAN="pacman --noconfirm"
        makepkg -sri --noconfirm
        cd ..
        rm -rf paru
        echo "Pikaur and Paru have sucessfully installed."
        echo "Press Enter to continue."
        read
    ;;

    "4" | "None" | "none")

        # User have chosen to not install any, script will exit back to where it was.
        echo "You have chosen None, this means you dont wish to install AUR Helper or anything in it."
        echo "Press Enter to contine."
        read
        echo "Exiting back to Arch_Programm_Installation_After_Reboot.sh"
    ;;
esac