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
DESKTOPMANAGER=""
DESKTOPENVIORMENTXORG=""
desktopenviorment=""
CONSOLE=""
GRAPHICAL=""
DAEMONS=""
NONE=""
STACKINGAUR=""
TILINGAUR=""
DYNAMICAUR=""
CONSOLEAUR=""
GRAPHICALAUR=""
DAEMONSAUR=""
WINDOWMANAGER=""
DISPLAYWINDOWMANAGER=""

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
        sudo pacman -S code --noconfirm
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

echo "Now were thru browsers, lets look in to some desktop environments aka GUI."
echo "Press Enter to continue."
read
clear

echo "Which desktop environment server do you wish to install?"
echo "1 - xorg"
echo "2 - wayland"
echo "3 - xwayland"
echo "4 - none"
read DESKTOPENVIORMENT
case "$DESKTOPENVIORMENT" in
    1)
        echo "Installing xorg"
        sudo pacman -S xorg-server xorg-apps xorg-xinit xogr-twm xorg-xclock xterm --noconfirm
        echo "Xorg have now been installed."
        echo "Press Enter to continue"
        read
        echo "On top of xorg you can install varius desktop environments, so lets look in to what you want."
        echo "Do you want a Desktop Environment or a Window manager installed on top of your Xorg session?"
        echo "1 - Desktop Environment"
        echo "2 - Window Manager"
        echo "3 - None"
        echo "Number 3 means you wish to use xorg in its raw form with no Desktop enviorment."
        read DESKTOPENVIORMENTXORG
        case "$DESKTOPENVIORMENTXORG" in
            1)
                clear
                echo "You have chosen Desktop Environment."
                echo "This means you wish to have a Window manager and Display manager in one packege."
                echo "Which desktop Environment do you wish to install?"
                echo "1 - GNOME"
                echo "2 - KDE Plasma"
                echo "3 - XFCE"
                echo "4 - LXQt"
                echo "5 - Cinnamon"
                echo "6 - MATE"
                echo "7 - Budgie"
                echo "8 - Deepin"
                echo "9 - Pantheon"
                echo "10 - LXDE"
                echo "11 - None"
                echo "If number 11 is chosen you are runing Xorg 'raw' and will have to manually install on top of it."
                read desktopenviorment
                case "$desktopenviorment" in
                    1)
                        echo "You have chosen GNOME."
                        echo "GNOME is a modern, user-friendly desktop environment."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of GNOME starting."
                        sudo pacman -S --noconfirm gnome
                        echo "GNOME have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    2)
                        echo "You have chosen KDE Plasma."
                        echo "KDE Plasma is a Feature-rich and highly customixable Desktop environment."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of KDE Plasma starting."
                        sudo pacman -S --noconfirm plasma
                        echo "KDE Plasma have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;
                    
                    3)
                        echo "You have chosen XFCE."
                        echo "XFCE is a lightweight and traditional desktop environment."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of XFCE starting."
                        sudo pacman -S --noconfirm xfce4 xfce4-goodies
                        echo "XFCE have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    4)
                        echo "You have chosen LXQt."
                        echo "LXQt is a lightweight desktop environment based on Qt, ideal for low-resource systems."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of LXQt starting."
                        sudo pacman -S --noconfirm lxqt
                        echo "LXQt have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    5)
                        echo "You have chosen Cinnamon."
                        echo "Cinnamon provides a traditional desktop experince, simmilar to GNOME 2."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Cinnamon starting."
                        sudo pacman -S --noconfirm Cinnamon
                        echo "Cinnamon have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    6)
                        echo "You have chosne MATE."
                        echo "LMATE continuation of GNOME 2, providing a classic desktop environment."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of MATE starting."
                        sudo pacman -S --noconfirm mate mate-extra
                        echo "MATE have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    7)
                        echo "You have chosen Budgie."
                        echo "Budgie a sleek, modern, and simple desktop environment, initially developed by the Solus project."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Budgie starting."
                        sudo pacman -S --noconfirm budgie-desktop
                        echo "Budgie have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    8)
                        echo "You have chosen Deepin."
                        echo "Deepin is a visually appealing desktop environment, originating from the Deepin Linux distribution."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Deepin starting."
                        sudo pacman -S --noconfirm deepin deepin-extra
                        echo "Deepin have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    9)
                        echo "You have chosen Pantheon."
                        echo "Pantheon is designed by the elementary OS team, Pantheon offers a beautiful and minimalist desktop environment."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Pantheon starting."
                        sudo pacman -S --noconfirm pantheon
                        echo "Pantheon have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    10)
                        echo "You have chosen LXDE."
                        echo "LXDE is a lightweight desktop environment designed for older hardware or for users who need simplicity and speed."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of LXDE starting."
                        sudo pacman -S --noconfirm lxde
                        echo "LXDE have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    11)
                        echo "You have chosen None."
                        echo "This means you wishes to run Xorg 'raw' or you wish to manually install a desktop enviorment."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                esac
            ;;

            2)
                clear
                echo "You have chosen Window Mannager."
                echo "This means you wish to install Window manager and Display manager sepratlly."
                echo "Lets start with Window manager, which one do you wish to install?"
                echo "1 - i3"
                echo "2 - i3-gaps"
                echo "3 - AwesomeWM"
                echo "4 - Bspwm"
                echo "5 - Herbstluftwm"
                echo "6 - Xmonad"
                echo "7 - Dwm"
                echo "8 - Ratpoison"
                echo "9 - Dluxbox"
                echo "10 - Enlightenment"
                echo "11 - Openbox"
                echo "12 - JWM"
                echo "13 - Matchbox"
                echo "14 - AfterStep"
                echo "15 - Fvwm"
                echo "16 - None"
                read WINDOWMANAGER
                case "$WINDOWMANAGER" in
                    1)
                        echo "You have chosen i3."
                        echo "i3 is a dynamic tiling window manager designed for users who prefer keyboard-centric navigation."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of i3 starting."
                        sudo pacman -S --noconfirm i3
                        echo "i3 have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    2)
                        echo "You have chosen i3-gaps."
                        echo "i3-gaps is a fork of i3 with gaps between windows for better aesthetics."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of i3-gaps starting."
                        sudo pacman -S --noconfirm i3-gaps
                        echo "i3-gaps have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    3)
                        echo "You have chosen AwsomeWM."
                        echo "AwsomeWM is a highly configurable, tiling window manager designed for users who like to fine-tune their environment."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of AwsomeWM starting."
                        sudo pacman -S --noconfirm awsome
                        echo "AwsomeWM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    4)
                        echo "You have chosen Bspwm."
                        echo "Bspwm is a tiling window manager that focuses on simplicity and uses bspc for configuration."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Bspwm starting."
                        sudo pacman -S --noconfirm bspwm
                        echo "Bspwm have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    5)
                        echo "You have chosen Herbstluftwm."
                        echo "Herbstluftwm is a manual tiling window manager where the layout is configured manually via a scriptable interface."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Herbstluftwm starting."
                        sudo pacman -S --noconfirm herbstluftwm
                        echo "Herbstluftwm have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    6)
                        echo "You have chosen Xmonad."
                        echo "Xmonad is a tiling window manager written in Haskell, emphasizing simplicity and flexibility."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Xmonad starting."
                        sudo pacman -S --noconfirm xmonad
                        echo "xmonad have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    7)
                        echo "You have chosen Dwm."
                        echo "Dwm is a minimalistic and lightweight tiling window manager, designed for advanced users who are comfortable editing its configuration directly in the source code."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Dwm starting."
                        sudo pacman -S --noconfirm dwm
                        echo "Dwm have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    8)
                        echo "You have chosen Ratpoison."
                        echo "Ratpoison is a simple, keyboard-driven window manager that eliminates the need for mouse interaction."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Ratpoison starting."
                        sudo pacman -S --noconfirm ratpoison
                        echo "Ratpoison have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    9)
                        echo "You have chosen Fluxbox."
                        echo "Fluxbox is a lightweight window manager that provides a traditional stacking window layout, but highly customizable."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Fluxbox starting."
                        sudo pacman -S --noconfirm fluxbox
                        echo "Fluxbox have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    10)
                        echo "You have chosen Enlightenment."
                        echo "Enlightenment is a highly customizable and visually appealing window manager that blurs the line between a DE and windw manager."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Enlightenment starting."
                        sudo pacman -S --noconfirm enlightenment
                        echo "Enlightenment have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    11)
                        echo "You have chosen Openbox."
                        echo "Openbox is a highly configurable, lightweight window manager that can be combined with a DE-like setup for users who want minimalism and flexibility."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Openbox starting."
                        sudo pacman -S --noconfirm openbox
                        echo "Openbox have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    12)
                        echo "You have chosen JWM."
                        echo "JWM is a lightweight window manager designed for resource-constrained enviorments."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of JWM starting."
                        sudo pacman -S --noconfirm jwm
                        echo "JWM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    13)
                        echo "You have chosen Matchbox."
                        echo "Matchbox is designed for embedded devices, but can be used on standard systems as a lightweight windw manager."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Matchbox starting."
                        sudo pacman -S --noconfirm matchbox
                        echo "Matchbox have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    14)
                        echo "You have chosen AfterStep."
                        echo "AfterStep is a window manager with a distinctive appearance, inspired by NeXTSTEP."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of AfterStep starting."
                        sudo pacman -S --noconfirm afterstep
                        echo "AfterStep have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    15)
                        echo "You have chosen Fvwm."
                        echo "Fvwm is a powerful and highly customizable window manager, known for its flexibility and lightweight nature."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of Fvwm starting."
                        sudo pacman -S --noconfirm fvwm
                        echo "iFvwm have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    16)
                        echo "You have chosen None."
                        echo "This means you have to either install a window manager manually or use Xorg 'raw'."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;
                esac
            ;;

            3)
                clear
                echo "You have chosen None."
                echo "This means you wish to run Xorg 'raw'."
                echo "Press Enter to continue"
                read
            ;;
        esac

        clear
        echo "Now that you have installed either a desktop environment or a winodw manager you will need a display manager."
        echo "If you have installed a desktop environment you wont need it."
        echo "what have you installed?"
        echo "1 - Desktop environment"
        echo "2 - Window manager"
        echo "3 - None"
        read DISPLAYMANAGER
        case "$DISPLAYMANAGER" in
            1)
               clear
               echo "You have chosen Desktop Environment."
               echo "This means you will already have a Display Manager installed in the package deal."
               echo "However if you are not happy about the standard one it can always be changed manually."
               echo "Press Enter to contineu"
               read
            ;;

            2)
                echo "You have chosen Window Manager."
                echo "Time to chose you Display Manager."
                echo "which one do you wish to install?"
                echo "1 - GDM"
                echo "2 - SDDM"
                echo "3 - LightDM"
                echo "4 - LXDM"
                echo "5 - XDM"
                echo "6 - CTWM"
                echo "7 - None"
                echo "If you chose 7 (None) then you will have to manually startx every time you boot your system."
                read DISPLAYWINDOWMANAGER
                case "$DISPLAYWINDOWMANAGER" in
                    1)
                        echo "You have chosen GDM."
                        echo "GDM is a simple and powerful display manager for GNOME, widely used with GNOME and other desktop environments."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of GDM starting."
                        sudo pacman -S --noconfirm gdm
                        echo "GDM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Now enabeling GDM Display Manager."
                        sudo systemctl enable gdm.service
                        echo "GDM service have been enabled."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    2)
                        echo "You have chosen SDDM."
                        echo "SDDM is a modern display ,amager with support for KDE Plasma and other desktop environments. It's highly customizable with themes."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of SDDM starting."
                        sudo pacman -S --noconfirm sddm
                        echo "SDDM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Now enabeling SDDM Display Manager."
                        sudo systemctl enable sddm.service
                        echo "SDDM service have been enabled."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    3)
                        echo "You have chosen LightDM."
                        echo "LightDM is a lightweight, highly configurable display manager that works well with various desktop environments, including XFCE,Cinnamon, MATE, etc."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of LightDM starting."
                        sudo pacman -S --noconfirm lightdm
                        echo "LightDM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Now enabeling LightDM Display Manager."
                        sudo systemctl enable lightdm.service
                        echo "LightDM service have been enabled."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    4)
                        echo "You have chosen LXDM."
                        echo "LXDM is a simple and lightweight display manager, usually used with LXDE and LXQt desktop environments."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of LXDM starting."
                        sudo pacman -S --noconfirm lxdm
                        echo "LXDM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Now enabeling LXDM Display Manager."
                        sudo systemctl enable lxdm.service
                        echo "LXDM service have been enabled."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    5)
                        echo "You have chosen XDM."
                        echo "XDM is a verry basic and lightweight display manager, providing just enough for stating a session. It's minimalistic and ideal for lightweight setups."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of XDM starting."
                        sudo pacman -S --noconfirm xdm
                        echo "XDM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Now enabeling XDM Display Manager."
                        sudo systemctl enable xdm.service
                        echo "XDM service have been enabled."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    6)
                        echo "You have chosen CTWM."
                        echo "CTWM is not as commonly used as the others, but a lightweight option."
                        echo "Press Enter to start installation"
                        read
                        echo "Installation of CTWM starting."
                        sudo pacman -S --noconfirm ctwm
                        echo "CTWM have now been installed, it can be booted with 'startx' once the script have finished runing."
                        echo "Now enabeling CTWM Display Manager."
                        sudo systemctl enable ctwm.service
                        echo "CTWM service have been enabled."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                    7)
                        echo "You have chosen None."
                        echo "This means you wont have a Display manager to boot x server for you, which means you either have to manually install a Display manager og run 'startx' every time you log in on the terminal."
                        echo "Press enter to continue"
                        read
                        clear
                    ;;
                esac
            ;;

            3)
                clear
                echo "You have chosen None."
                echo "This means you are either going to use Xorg in its 'raw' form or install a difrent environment on top manually,"
                echo "if you are planing to use Xorg 'raw' or install a Window Manager manually you can still install a display manager manually too,"
                echo "however if you plan to install a Desktop Environment I would not recomend to install another Display Manager."
                echo "Press Enter to continue"
                read
            ;;
        esac
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
                        sudo pacman -S --noconfirm enlightenment 
                        echo "Enlightenment have been installed."
                    ;;

                    2)
                        echo "You have picked Kwin, installing."
                        sudo pacman -S --noconfirm kwin
                        echo "Kwin have been installed." 
                    ;;

                    3)
                        echo "You have picked Labwc, installing."
                        sudo pacman -S --noconfirm labwc
                        echo "Labwc have been installed." 
                    ;;

                    4)
                        echo "You have picked Mutter, installing."
                        sudo pacman -S --noconfirm mutter
                        echo "Mutter have been installed." 
                    ;;

                    5)
                        echo "You have picked Weston, installing."
                        sudo pacman -S --noconfirm weston
                        echo "Weston have been installed." 
                    ;;

                    6)
                        echo "You have picked Hikari, Hikari cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    7)
                        echo "You have picked Liri Shell, Liri Shell cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    8)
                        echo "You have picked Wayfire, Wayfire cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    9)
                        echo "You have picked Wio, Wio cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
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
                        sudo pacman -S --noconfirm niri
                        echo "Niri have been installed."
                    ;;

                    2)
                        echo "You have picked Qtile, installing."
                        sudo pacman -S --noconfirm qtile
                        echo "Qtile have been installed." 
                    ;;

                    3)
                        echo "You have picked Sway, installing."
                        sudo pacman -S --noconfirm sway
                        echo "Sway have been installed." 
                    ;;

                    4)
                        echo "You have picked Cagebreak, Cagebreak cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    5)
                        echo "You have picked Miracle-wm, Miracle-wm cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    6)
                        echo "You have picked SwayFx, SwayFx cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    7)
                        echo "You have picked Velox, Velox cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
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
                        sudo pacman -S --noconfirm hyprland
                        echo "Hyprland have been installed."
                    ;;

                    2)
                        echo "You have picked River, installing."
                        sudo pacman -S --noconfirm river
                        echo "River have been installed." 
                    ;;

                    3)
                        echo "You have picked Dwl, Dwl cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read DYNAMICAUR
                        case "$DYNAMICAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    4)
                        echo "You have picked Japokwm, Japokwm cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read DYNAMICAUR
                        case "$DYNAMICAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    5)
                        echo "You have picked Vivarium, Vivarium cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read DYNAMICAUR
                        case "$DYNAMICAUR" in
                         "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    6)
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;
                esac
            ;;

            4)
                echo "You have picked an Other Compositor, whcih one do you wish for?"
                echo "1 - Cage"
                echo "2 - Phoc"
                echo "3 - none"
                echo "Number 3 thru 5 is AUR specific and will require you to run the script again and install them thru that,"
                echo "or to manually install them, if 6 is picked no gui will be installed and script have to be ran again or manually install it."
                read OTHER
                case "$OTHER" in
                     1)
                        echo "You have picked Cage, installing."
                        sudo pacman -S --noconfirm cage
                        echo "Cage have been installed."
                    ;;

                    2)
                        echo "You have picked Phoc, installing."
                        sudo pacman -S --noconfirm phoc
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
        sudo pacman -S --noconfirm xorg-xwayland
        echo "Xwayland have been installed."
        echo "Press Enter to continue."
        read
    ;;

    4)
        echo "You have chosen no GUI, this means you have to reboot the script or install one manually if you wish for one"
    ;;
esac


echo "Now were thru all the Grafical interfaces, lets look in to some Display Managers."
echo "Press Enter to continue."
read
clear

echo "Which type of desktop manager do you wish to install?"
echo "1 - Console"
echo "2 - Graphical"
echo "3 - Login Daemons"
echo "4 - none"
read DESKTOPMANAGER
case "$DESKTOPMANAGER" in
    1)
        echo "You have picked a Console Desktop manager, whcih one do you wish for?"
        echo "1 - Nodm"
        echo "2 - Ly"
        echo "3 - Emptty"
        echo "4 - Lemurs"
        echo "5 - CDM"
        echo "6 - Console TDM"
        echo "7 - Tbsm"
        echo "8 - Loginx"
        echo "9 - None"
        echo "Number 5 thru 8 is AUR specific and will require you to run the script again and install them thru that,"
        echo "or to manually install them, if 9 is picked no Desktop manager will be installed and script have to be ran again or manually install it."
        read CONSOLE
        case "$CONSOLE" in
            1)
                echo "You have picked Nodm Desktop manager, installing."
                sudo pacman -S nodm --noconfirm
                echo "Nodm have been installed."
            ;;

            2)
                echo "You have picked Ly Desktop manager, installing."
                sudo pacman -S ly --noconfirm
                echo "Ly have been installed."
            ;;

            3)
                echo "You have picked Emptty Desktop manager, installing."
                sudo pacman -S emptty --noconfirm
                echo "Emptty have been installed."
            ;;

            4)
                echo "You have picked Lemurs Desktop manager, installing."
                sudo pacman -S lemurs --noconfirm
                echo "Lemurs have been installed."
            ;;

            5)
                echo "You have picked CDM, CDM Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read CONSOLEAUR
                case "$CONSOLEAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            6)
                echo "You have picked Console TDM, Console TDM Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read CONSOLEAUR
                case "$CONSOLEAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac
            ;;

            7)
                echo "You have picked Tbsm, Tbsm Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read CONSOLEAUR
                case "$CONSOLEAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac
            ;;

            8)
                echo "You have picked Loginx, Loginx Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read CONSOLEAUR
                case "$CONSOLEAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            9)
                echo "You have picked None, you'll have to reload the script or manually install a Desktop manager."
                echo "Press Enter to continue."
                read 
            ;;
        esac
    ;;

    2)
        echo "You have picked a Graphical Desktop manager, whcih one do you wish for?"
        echo "1 - GDM"
        echo "2 - LightDM"
        echo "3 - LXDM"
        echo "4 - SDDM"
        echo "5 - Slim"
        echo "6 - XDM"
        echo "7 - Entrance"
        echo "8 - None"
        echo "Number 7 is AUR specific and will require you to run the script again and install them thru that,"
        echo "or to manually install them, if 8 is picked no Desktop manager will be installed and script have to be ran again or manually install it."
        read GRAPHICAL
        case "$GRAPHICAL" in
            1)
                echo "You have picked GDM Desktop manager, installing."
                sudo pacman -S gdm3 --noconfirm
                echo "GDM have been installed."
            ;;

            2)
                echo "You have picked LightDM Desktop manager, installing."
                sudo pacman -S lightdm --noconfirm
                echo "LightDM have been installed."
            ;;

            3)
                echo "You have picked LXDM Desktop manager, installing."
                sudo pacman -S lxdm --noconfirm
                echo "LXDM have been installed."
            ;;

            4)
                echo "You have picked SDDM Desktop manager, installing."
                sudo pacman -S sddm --noconfirm
                echo "SDDM have been installed."
            ;;

            5)
                echo "You have picked Slim Desktop manager, installing."
                sudo pacman -S slim --noconfirm
                echo "Slim have been installed."
            ;;

            6)
                echo "You have picked XDM Desktop manager, installing."
                sudo pacman -S xorg-xdm --noconfirm
                echo "XDM have been installed."
            ;;

            7)
                echo "You have picked Entrance, Entrance Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read GRAPHICALAUR
                case "$GRAPHICALAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            8)
                echo "You have picked None, you'll have to reload the script or manually install a Desktop manager."
                echo "Press Enter to continue."
                read 
            ;;
        esac
    ;;

    3)
        echo "You have picked Login Daemons Desktop manager, as for Login Daemons there is only one known as Greeted,"
        echo "Greeted have multiple daemons you can install, the standard one that it comes with is"
        echo "greetd-agreety, since you can install others which one do you wish for?"
        echo "If you dont wish to change, just pick None" 
        echo "1 - Cosmic-greeter"
        echo "2 - Tuigreet"
        echo "3 - Nwg-hello"
        echo "4 - Dlm"
        echo "5 - Ddlm"
        echo "6 - Gtkgreet"
        echo "7 - ReGreet"
        echo "8 - Wlgreet"
        echo "9 - Qtgreet "
        echo "10 - None"
        echo "Number 4 thru 9 is AUR specific and will require you to run the script again and install them thru that,"
        echo "or to manually install them, if 6 is picked no gui will be installed and script have to be ran again or manually install it."
        read DAEMONS
        case "$DAEMONS" in
            1)
                echo "You have picked Cosmic-greeter Desktop manager, installing."
                sudo pacman -S greetd cosmic-greeter --noconfirm
                echo "Cosmic-greeter have been installed."
            ;;

            2)
                echo "You have picked Tuigreet Desktop manager, installing."
                sudo pacman -S greetd greetd-tuigreet --noconfirm
                echo "Tuigreet have been installed."
            ;;

            3)
                echo "You have picked Nwg-hello Desktop manager, installing."
                sudo pacman -S greetd nwg-hello --noconfirm
                echo "Nwg-hello have been installed."
            ;;

            4)
                echo "You have picked Dlm, Dlm Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read DAEMONSAUR
                case "$DAEMONSAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac  
            ;;

            5)
                echo "You have picked Ddlm, Ddlm Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read DAEMONSAUR
                case "$DAEMONSAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            6)
                echo "You have picked Gtkgreet, Gtkgreet Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read DAEMONSAUR
                case "$DAEMONSAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            7)
                echo "You have picked ReGreet, ReGreet Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read DAEMONSAUR
                case "$DAEMONSAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            8)
                echo "You have picked Wlgreet, Wlgreet Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read DAEMONSAUR
                case "$DAEMONSAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            9)
                echo "You have picked Qtgreet, Qtgreet Desktop manager cannot be installed with pacman and will need you to"
                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                read DAEMONSAUR
                case "$DAEMONSAUR" in
                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")
                        echo "You have chosen YES, Booting AUR_Helper script"
                        ./AUR_Helper.sh
                    ;;

                    "NO" | "N" | "no" | "n" | "No" | "nO")
                        echo "You have said no to booting AUR helper, continueing installation script."
                        echo "Press Enter to continue"
                        read
                    ;;
                esac 
            ;;

            10)
                echo "You have picked None, either you want the standard setting or not."
                echo "1 - Standard setting"
                echo "2 - None"
                read NONE
                case "$NONE" in
                    1)
                        echo "You have picked standard settings for Greetd."
                        sudo pacman -S greetd --noconfirm
                        echo "Greetd have been installed and have standard settings."
                    ;;

                    2)
                    echo "You have picked None."
                    echo "This means you'll have to set up a desktop manager manually or run the script again."
                    echo "Press Enter to continue"
                    read
                    ;;
                esac
            ;;
        esac
    ;;

    4)
        echo "You have chosen no GUI, this means you have to reboot the script or install one manually if you wish for one"
    ;;
esac