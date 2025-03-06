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
STACKING=""
TILING=""
DYNAMIC=""

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
        echo "Installing Vim."
        sudo pacman -S vim --noconfirm
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Vim."
    ;;
esac


echo "Want to install Nano? Y/N"
read NANO
case "$NANO" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing Nano."
        sudo pacman -S nano --noconfirm
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Nano."
    ;;
esac

echo "Want to install Visual Studio Code? Y/N"
read CODE
case "$CODE" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing VS Code."
        sudo pacman -S CODE --noconfirm
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing VS Code."
    ;;
esac

echo "Want to install NeoVim (NVim)? Y/N"
read NVIM
case "$NVIM" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing NVim."
        sudo pacman -S neovim --noconfirm
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing NVim."
    ;;
esac

echo "Want to install Osidian? (this only work on xorg or xwayland) Y/N"
read OBSIDIAN
case "$OBSIDIAN" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Installing Obsidian."
        sudo pacman -S obsidian --noconfirm
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
        echo "Installing Firefox."
        sudo pacman -S firefox --noconfirm
    ;;

    "NO" | "N" | "no" | "n" | "No" | "nO")
        echo "You have said no to installing Firefox."
    ;;
esac

echo "you need AUR helper to install further browsers, if you wish there is a script for that otherwise we'll continue Y/N?."
read AURHELP
case "$AURHELP" in
    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
        echo "Booting AUR helper script."
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
        sudo pacman -S xorg-server xorg-apps xorg-xinit xogr-twm xorg-xclock xterm --noconfirm
        echo "Xorg have now been installed"
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
                echo "1 - Enlightenment"
                echo "2 - Kwin"
                echo "3 - Labwc"
                echo "4 - Mutter"
                echo "5 - Weston"
                echo "6 - Hikari"
                echo "7 - Liri Shell"
                echo "8 - Wayfire"
                echo "9 - Wio"
                echo "10 - none"
                echo "Number 6 thru 9 is AUR specific and will require you to run the script again and install them thru that,"
                echo "or to manually install them, if 10 is picked no gui will be installed and script have to be ran again or manually install it."
                read STACKING
                case "$STACKING in
                    1)
                        echo "You have picked Enlightenment, installing."
                        sudo pacman -S enlightenment --noconfirm
                        echo "Enlightenment have been installed."
                    ;;

                    2)
                        echo "You have picked Kwin, installing."
                        sudo pacman -S kwin --noconfirm
                        echo "Kwin have been installed." 
                    ;;

                    3)
                        echo "You have picked Labwc, installing."
                        sudo pacman -S labwc --noconfirm
                        echo "Labwc have been installed." 
                    ;;

                    4)
                        echo "You have picked Mutter, installing."
                        sudo pacman -S mutter --noconfirm
                        echo "Mutter have been installed." 
                    ;;

                    5)
                        echo "You have picked Weston, installing."
                        sudo pacman -S weston --noconfirm
                        echo "Weston have been installed." 
                    ;;

                    6)
                        echo "You have picked Hikari, Hikari cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    7)
                        echo "You have picked Liri Shell, Liri Shell cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read  
                    ;;

                    8)
                        echo "You have picked Wayfire, Wayfire cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    9)
                        echo "You have picked Wio, Wio cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    10)
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;
                esac
            ;;

            2)
                echo "You have picked a Tiling Compositor, whcih one do you wish for?"
                echo "1 - Niri"
                echo "2 - Qtile"
                echo "3 - Sway"
                echo "4 - Cagebreak"
                echo "5 - Miracle-wm"
                echo "6 - SwayFx"
                echo "7 - Velox"
                echo "8 - none"
                echo "Number 4 thru 7 is AUR specific and will require you to run the script again and install them thru that,"
                echo "or to manually install them, if 8 is picked no gui will be installed and script have to be ran again or manually install it."
                read TILING
                case "$TILING" in
                     1)
                        echo "You have picked Niri, installing."
                        sudo pacman -S niri --noconfirm
                        echo "Niri have been installed."
                    ;;

                    2)
                        echo "You have picked Qtile, installing."
                        sudo pacman -S qtile --noconfirm
                        echo "Qtile have been installed." 
                    ;;

                    3)
                        echo "You have picked Sway, installing."
                        sudo pacman -S sway --noconfirm
                        echo "Sway have been installed." 
                    ;;

                    4)
                        echo "You have picked Cagebreak, Cagebreak cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    5)
                        echo "You have picked Miracle-wm, Miracle-wm cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read  
                    ;;

                    6)
                        echo "You have picked SwayFx, SwayFx cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    7)
                        echo "You have picked Velox, Velox cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    8)
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;                    
                esac
            ;;
                
            3)
                echo "You have picked a Dynamic Compositor, whcih one do you wish for?"
                echo "1 - Hyprland"
                echo "2 - River"
                echo "3 - Dwl"
                echo "4 - Japokwm"
                echo "5 - Vivarium"
                echo "6 - none"
                echo "Number 3 thru 5 is AUR specific and will require you to run the script again and install them thru that,"
                echo "or to manually install them, if 6 is picked no gui will be installed and script have to be ran again or manually install it."
                read DYNAMIC
                case "$DYNAMIC" in
                     1)
                        echo "You have picked Hyprland, installing."
                        sudo pacman -S hyprland --noconfirm
                        echo "Hyprland have been installed."
                    ;;

                    2)
                        echo "You have picked River, installing."
                        sudo pacman -S river --noconfirm
                        echo "River have been installed." 
                    ;;

                    3)
                        echo "You have picked Dwl, Dwl cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read  
                    ;;

                    4)
                        echo "You have picked Japokwm, Japokwm cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    5)
                        echo "You have picked Vivarium, Vivarium cannot be installed with pacman and will need you to"
                        echo "reboot the script and chose to install AUR Helper and go thru that script porting for it."
                        echo "ending script block, press Enter to continue."
                        read 
                    ;;

                    6)
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;
                esac
            ;;

            4)
                echo "You have picked a Other Compositor, whcih one do you wish for?"
                echo "1 - Cage"
                echo "2 - Phoc"
                echo "3 - none"
                echo "Number 3 thru 5 is AUR specific and will require you to run the script again and install them thru that,"
                echo "or to manually install them, if 6 is picked no gui will be installed and script have to be ran again or manually install it."
                read OTHER
                case "$OTHER" in
                     1)
                        echo "You have picked Cage, installing."
                        sudo pacman -S cage --noconfirm
                        echo "Cage have been installed."
                    ;;

                    2)
                        echo "You have picked Phoc, installing."
                        sudo pacman -S phoc --noconfirm
                        echo "Phoc have been installed." 
                    ;;

                    3)
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;
                esac
            ;;

            5)
                echo "You have no Compositor and therefore will not have a GUI unless installed manually or script is rebooted."
            ;;
        esac
    ;;

    3)
        echo "Installing xwayland"
        sudo pacman -S xorg-xwayland --noconfirm
        echo "Xwayland have been installed."
        echo "Press Enter to continue."
        read
    ;;

    4)
        echo "You have chosen no GUI, this means you have to reboot the script or install one manually if you wish for one"
    ;;
    esac


    echo "Now were thru all the Grafical interfaces, lets look in to some Display Managers."
    