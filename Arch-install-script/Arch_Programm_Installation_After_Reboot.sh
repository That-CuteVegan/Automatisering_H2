#!/bin/bash

# This script is supposed to be ran after your pc/vm have Arch configured and installed on to it and is able to be booted in to.
# This script will go thru and promt the user and install wanted programs.

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

# Goes thru case statements to install browsers the user wishes to use.
