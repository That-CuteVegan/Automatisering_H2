#!/bin/bash

# This script is supposed to be ran after your pc/vm have Arch configured and installed on to it and is able to be booted in to.
# This script will go thru and promt the user and install wanted programs.

# Variables for the script to be used
VIM=""
NANO=""
CODE=""
NVIM=""
OBSIDIAN=""
FIREFOX=""
AURHELP=""
DESKTOPENVIORMENT=""
COMPOSITOR=""

echo "Welcome to this installation script, we'll go over each potentially needed program and ask if you wish it installed."
echo "Press Enter to continue"
read

# Updates the mirrors for the pacman command.
pacman -Syy

# Runs thru a bunch of case statements to see what texts editors the user wishes to install.
echo "Lets start off with some text editors."
echo "Want to install Vim? Y/N"
read VIM
case "$VIM" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing Vim"
        sudo pacman -S vim
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Vim."
    ;;
esac


echo "Want to install Nano? Y/N"
read NANO
case "$NANO" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing Nano"
        sudo pacman -S nano
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Nano."
    ;;
esac

echo "Want to install Visual Studio Code? Y/N"
read CODE
case "$CODE" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing VS Code"
        sudo pacman -S CODE
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing VS Code."
    ;;
esac

echo "Want to install NeoVim (NVim)? Y/N"
read NVIM
case "$NVIM" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing NVim"
        sudo pacman -S neovim
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing NVim."
    ;;
esac

echo "Want to install Osidian? (this only work on xorg or xwayland) Y/N"
read OBSIDIAN
case "$OBSIDIAN" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing Obsidian"
        sudo pacman -S obsidian
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Obsidian."
    ;;
esac

echo "Now we have gone thru some good to use text editors, lets move on to browsers."
echo "Press Enter to continue"
read
clear

# Goes thru case statements to install browsers the user wishes to use.
echo "Want to install Firefox? Y/N"
read FIREFOX
case "$FIREFOX" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing Firefox"
        sudo pacman -S firefox
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Firefox."
    ;;
esac

echo "you need AUR helper to install further browsers, if you wish there is a script for that otherwise we'll continue Y/N?."
read AURHELP
case "$AURHELP" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Booting AUR helper script"
        ./AUR_Helper.sh
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing AUR helper, continueing installation script."
    ;;
esac

echo "Now were thru browsers, lets look in to some desktop enviorments aka GUI."
echo "Press Enter to continue."
read
clear

echo "Which desktop enviorment do you wish to install?"
echo "1 - xorg"
echo "2 - wayland"
echo "3 - xwayland"
echo "4 - none"
read DESKTOPENVIORMENT
case "$DESKTOPENVIORMENT" in
    1)
        echo "Installing xorg"
        sudo pacman -S xorg-server xorg-apps xorg-xinit xogr-twm xorg-xclock xterm
    ;;

    2)
        echo "Wayland needs a Compositor, which kind do you wish to use?"
        echo "1 - Stacking"
        echo "2 - Tiling"
        echo "3 - Dynamic"
        echo "4 - Other"
        echo "5 - none"
        echo "Number 5 also mean you dont wish to install any GUI and will have to do it manually."
        read COMPOSITOR
        case "$COMPOSITOR" in
            1)
                echo "You have picked a Stacking Compositor, whcih one do you wish for?"

            ;;

            2)
                echo "You have picked a Tiling Compositor, whcih one do you wish for?"
            ;;
                
            3)
                echo "You have picked a Dynamic Compositor, whcih one do you wish for?"
            ;;

            4)
                echo "You have picked a Other Compositor, whcih one do you wish for?"
            ;;

            5)
                echo "You have no Compositor and therefore will not have a GUI unless installed manually."
            ;;
        esac
    ;;

    3)
        echo "Installing xwayland"
    ;;

    4)

    ;;
    esac