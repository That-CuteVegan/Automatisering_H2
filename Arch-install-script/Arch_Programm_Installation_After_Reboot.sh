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
DISPLAYMANAGER=""
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
# Asks the user if they wishes to install Vim.
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

# Asks user if they wishes to install Nano.
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

# Asks user if they wishes to install Visual Studio Code (AKA Code).
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

# Asks the user if they wishes to install NVim.
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

# Asks the users if they wish to install Obsidian.
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
# Asks the user if they wish to install Firefox.
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

# Informs user anything other then Firefox needs AUR helper and asks if the user wishes to boot in to it now to install something from it.
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

# Code Block to set a grafical enviorment on the machine if the user wishes for it.
# Asks user which compiler they wish to use for their desktop environment.
echo "Which desktop environment server do you wish to install?"
echo "1 - xorg"
echo "2 - wayland"
echo "3 - xwayland"
echo "4 - none"
read DESKTOPENVIORMENT
case "$DESKTOPENVIORMENT" in
    1)

        # User have chosen to use Xorg and goes thru the installation of it.
        echo "Installing xorg"
        sudo pacman -S xorg-server xorg-apps xorg-xinit xogr-twm xorg-xclock xterm --noconfirm
        echo "Xorg have now been installed."
        echo "Press Enter to continue"
        read

        # Informs user that further grafical environment can be installed on top of Xorg and asks which they wish for.
        echo "On top of xorg you can install varius desktop environments, so lets look in to what you want."
        echo "Do you want a Desktop Environment or a Window manager installed on top of your Xorg session?"
        echo "1 - Desktop Environment"
        echo "2 - Window Manager"
        echo "3 - None"
        echo "Number 3 means you wish to use xorg in its raw form with no Desktop enviorment."
        read DESKTOPENVIORMENTXORG
        case "$DESKTOPENVIORMENTXORG" in
            1)

                # User have chosen to go with a Desktop Environment, goes thru a list of DE's that works with Xorg and asks which one they wishes to install.
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

                        # User have chosen to install GNOME, block installs GNOME for user.
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

                        # User have chosen to install KDE Plasma, block installs KDE Plasma for user.
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

                        # User have chosen to install XFCE, block installs XFCE for user.
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

                        # User have chosen to install LXQt, block installs LXQt for user.
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

                        # User have chosen to install Cinnamon, block installs Cinnamon for user.
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

                        # User have chosen to install MATE, block installs MATE for user.
                        echo "You have chosne MATE."
                        echo "MATE continuation of GNOME 2, providing a classic desktop environment."
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

                        # User have chosen to install Budgie, block installs Budgie for user.
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

                        # User have chosen to install Deepin, block installs Deepin for user.
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

                        # User have chosen to install Pantheon, block installs Pantheon for user.
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

                        # User have chosen to install LXDE, block installs LXDE for user.
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

                        # User have chosen to install no DE on their system.
                        echo "You have chosen None."
                        echo "This means you wishes to run Xorg 'raw' or you wish to manually install a desktop enviorment."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;

                esac
            ;;

            2)

                # User have chosen to go with a Window Manager, goes thru a list of WM's that works with Xorg and asks which one they wishes to install.
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

                        # User have chosen to install i3, block installs i3 for user.
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

                        # User have chosen to install i3-gaps, block installs i3-gaps for user.
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

                        # User have chosen to install AwsomeWM, block installs AwsomeWM for user.
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

                        # User have chosen to install Bspwm, block installs Bspwm for user.
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

                        # User have chosen to install Herbstluftwm, block installs Herbstluftwm for user.
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

                        # User have chosen to install Xmonad, block installs Xmonad for user.
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

                        # User have chosen to install Dwm, block installs Dwm for user.
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

                        # User have chosen to install Ratpoison, block installs Ratpoison for user.
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

                        # User have chosen to install Fluxbox, block installs Fluxbox for user.
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

                        # User have chosen to install Enlightenment, block installs Enlightenment for user.
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

                        # User have chosen to install Openbox, block installs Openbox for user.
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

                        # User have chosen to install JWM, block installs JWM for user.
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

                        # User have chosen to install Matchbox, block installs Matchbox for user.
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

                        # User have chosen to install AfterStep, block installs AfterStep for user.
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

                        # User have chosen to install Fvwm, block installs Fvwm for user.
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

                        # User have chosen to install no Windown Manager.
                        echo "You have chosen None."
                        echo "This means you have to either install a window manager manually or use Xorg 'raw'."
                        echo "Press Enter to continue"
                        read
                        clear
                    ;;
                esac
            ;;

            3)

                # User have chosen to install neither Desktop Environment or Window Manager.
                clear
                echo "You have chosen None."
                echo "This means you wish to run Xorg 'raw'."
                echo "Press Enter to continue"
                read
            ;;
        esac

        # Asks the user which environment they installed due to if they only have a window manager they will also need a display manager to be able to boot their session.
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

                # User have specified they have installed a DE which is both a WM and a DM in one package.
               clear
               echo "You have chosen Desktop Environment."
               echo "This means you will already have a Display Manager installed in the package deal."
               echo "However if you are not happy about the standard one it can always be changed manually."
               echo "Press Enter to contineu"
               read
            ;;

            2)

                # User have specified they have installed a Window manager and therefore need a Display manager, block asks them if they want a grafical or other kind of DM.
                echo "You have chosen Window Manager."
                echo "Which type of Display Manager do you wish to install along with your Window Manager?"
                echo "Know that only a grapical one can auto boot your Window Manager."
                echo "1 - Console"
                echo "2 - Graphical"
                echo "3 - Login Daemons"
                echo "4 - none"
                read DESKTOPMANAGER
                case "$DISPLAYMANAGER" in
                    1)

                        # User have chosen Console Display Manager and the block asks the user wich one they wish to install.
                        echo "You have picked a Console Display Manager, whcih one do you wish for?"
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

                                # User have chosen to install Nodm, block installs Nodm for user.
                                echo "You have picked Nodm Display Manager."
                                echo "Ready to install Nodm?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm nodm
                                echo "Nodm have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            2)

                                # User have chosen to install Ly, block installs i3 for user.
                                echo "You have picked Ly Display Manager."
                                echo "Ready to install Ly?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm ly
                                echo "Ly have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            3)

                                # User have chosen to install Emptty, block installs Emptty for user.
                                echo "You have picked Emptty Display Manager."
                                echo "Ready to install Emptty?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm emptty
                                echo "Emptty have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            4)

                                # User have chosen to install Lemurs, block installs Lemurs for user.
                                echo "You have picked Lemurs Display Manager."
                                echo "Ready to install Lemurs?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm lemurs
                                echo "Lemurs have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            5)

                                # User have chosen to install CMD, informs user that CMD require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked CDM, CDM Display Manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read CONSOLEAUR
                                case "$CONSOLEAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            6)

                                # User have chosen to install TDM, informs user that TDM require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Console TDM, Console TDM Display Manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read CONSOLEAUR
                                case "$CONSOLEAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac
                            ;;

                            7)

                                # User have chosen to install Tbsm, informs user that Tbsm require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Tbsm, Tbsm Display Manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read CONSOLEAUR
                                case "$CONSOLEAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac
                            ;;

                            8)

                                # User have chosen to install Lognix, informs user that Lognix require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Loginx, Loginx Display Manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read CONSOLEAUR
                                case "$CONSOLEAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            9)

                                # User have chosen to install No Console Display Manager.
                                echo "You have picked None, you'll have to reload the script or manually install a Display Manager."
                                echo "Press Enter to continue."
                                read 
                            ;;
                        esac
                    ;;

                    2)

                        # User have chosen Graphical Display Manager and the block asks the user wich one they wish to install.
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

                                # User have chosen to install GDM, block installs GDM for user.
                                echo "You have picked GDM Display Manager."
                                echo "Ready to install GDM?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm gdm3
                                echo "GDM have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            2)

                                # User have chosen to install LightDM, block installs LightDM for user.
                                echo "You have picked LightDM Display Manager."
                                echo "Ready to install LightDM?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm lightdm
                                echo "LightDM have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            3)

                                # User have chosen to install LXDM, block installs LXDM for user.
                                echo "You have picked LXDM Display Manager."
                                echo "Ready to install LXDM?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm lxdm
                                echo "LXDM have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            4)

                                # User have chosen to install SDDM, block installs SDDM for user.
                                echo "You have picked SDDM Display Manager."
                                echo "Ready to install SDDM?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm sddm
                                echo "SDDM have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            5)

                                # User have chosen to install Slim, block installs GDM for user.
                                echo "You have picked Slim Display Manager."
                                echo "Ready to install Slim?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm slim
                                echo "Slim have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            6)

                                # User have chosen to install XDM, block installs XDM for user.
                                echo "You have picked XDM Display Manager."
                                echo "Ready to install XDM?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm xorg-xdm
                                echo "XDM have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            7)

                                # User have chosen to install Entrance, informs user that Entrance require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Entrance, Entrance Display Manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read GRAPHICALAUR
                                case "$GRAPHICALAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            8)

                                # User have chosen to install No Graphical Display Manager.
                                echo "You have picked None, you'll have to reload the script or manually install a Desktop manager."
                                echo "Press Enter to continue."
                                read 
                            ;;
                        esac
                    ;;

                    3)

                        # User have chosen Login Daemons Display Manager and the block asks the user wich style of Greeted they wish to install.
                        echo "You have picked Login Daemons Display Manager, as for Login Daemons there is only one known as Greeted,"
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

                                # User have chosen to install Cosmic-greeter, block installs Cosmic-greeter for user.
                                echo "You have picked Cosmic-greeter Display Manager theme."
                                echo "Ready to install Cosmic-greeter?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm greetd cosmic-greeter 
                                echo "Cosmic-greeter have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            2)

                                # User have chosen to install Tuigreet, block installs Tuigreet for user.
                                echo "You have picked Tuigreet Display Manager theme."
                                echo "Ready to install Tuigreet?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm greetd greetd-tuigreet
                                echo "Tuigreet have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            3)

                                # User have chosen to install Nwg-hello, block installs Nwg-hello for user.
                                echo "You have picked Nwg-hello Display Manager theme."
                                echo "Ready to install Nwg-hello?"
                                echo "Press Enter to continue"
                                read
                                sudo pacman -S --noconfirm greetd nwg-hello 
                                echo "Nwg-hello have been installed."
                                echo "Press Enter to continue"
                                read
                            ;;

                            4)

                                # User have chosen to install Dlm, informs user that Dlm require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Dlm, Dlm Desktop manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read DAEMONSAUR
                                case "$DAEMONSAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac  
                            ;;

                            5)

                                # User have chosen to install Ddlm, informs user that Ddlm require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Ddlm, Ddlm Desktop manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read DAEMONSAUR
                                case "$DAEMONSAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            6)

                                # User have chosen to install Gtkgreed, informs user that Gtkgreet require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Gtkgreet, Gtkgreet Desktop manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read DAEMONSAUR
                                case "$DAEMONSAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            7)

                                # User have chosen to install ReGreet, informs user that ReGreet require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked ReGreet, ReGreet Desktop manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read DAEMONSAUR
                                case "$DAEMONSAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            8)

                                # User have chosen to install Wlgreet, informs user that Wlgreet require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Wlgreet, Wlgreet Desktop manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read DAEMONSAUR
                                case "$DAEMONSAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            9)

                                # User have chosen to install Qtgreet, informs user that Qtgreet require AUR helper and asks if they wishes to boot the script.
                                echo "You have picked Qtgreet, Qtgreet Desktop manager cannot be installed with pacman and will need you to"
                                echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                                read DAEMONSAUR
                                case "$DAEMONSAUR" in
                                    "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                                        # User have said Yes to booting the AUR helper script.
                                        echo "You have chosen YES, Booting AUR_Helper script"
                                        ./AUR_Helper.sh
                                    ;;

                                    "NO" | "N" | "no" | "n" | "No" | "nO")

                                        # User have said No to booting the AUR helper script.
                                        echo "You have said no to booting AUR helper, continueing installation script."
                                        echo "Press Enter to continue"
                                        read
                                    ;;
                                esac 
                            ;;

                            10)

                                # User have chosen to install no Greetd theme or to go with the standard one, this block determins that.
                                echo "You have picked None, either you want the standard setting or not."
                                echo "1 - Standard setting"
                                echo "2 - None"
                                read NONE
                                case "$NONE" in
                                    1)

                                        # User have picked to go with the standard settings for Greetd, installs Greeted with no theme configurations
                                        echo "You have picked standard settings for Greetd."
                                        echo "Ready to install Greetd with standard settings?"
                                        echo "Press Enter to continue"
                                        read
                                        sudo pacman -S --noconfirm greetd
                                        echo "Greetd have been installed and have standard settings."
                                        echo "Press Enter to continue"
                                        read
                                    ;;

                                    2)

                                        # User have chosen to install No Login Daemon Display Manager.
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

                        # User have chosen to install No grafical interface at all.
                        echo "You have chosen no GUI, this means you have to reboot the script or install one manually if you wish for one"
                    ;;
                esac
            ;;

            3)

                # User have specified they have installed neither Desktop Environment or Window Manager.
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

        # User have chosen to install Wayland, Wayland uses Compositor's so block asking which type the user wishes to install.
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

                # User have chosen a Stacking Compositor, block asks which one the user wishes to install.
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

                        # User have chosen Enlightenment, block installs Enlightenment for user.
                        echo "You have picked Enlightenment, installing."
                        sudo pacman -S --noconfirm enlightenment 
                        echo "Enlightenment have been installed."
                        echo "Press Enter to continue"
                        read
                    ;;

                    2)

                        # User have chosen Kwin, block installs Kwin for user.
                        echo "You have picked Kwin, installing."
                        sudo pacman -S --noconfirm kwin
                        echo "Kwin have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    3)

                        # User have chosen Labwc, block installs Labwc for user.
                        echo "You have picked Labwc, installing."
                        sudo pacman -S --noconfirm labwc
                        echo "Labwc have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    4)
                    
                        # User have chosen Mutter, block installs Mutter for user.
                        echo "You have picked Mutter, installing."
                        sudo pacman -S --noconfirm mutter
                        echo "Mutter have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    5)

                        # User have chosen Weston, block installs Weston for user.
                        echo "You have picked Weston, installing."
                        sudo pacman -S --noconfirm weston
                        echo "Weston have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    6)

                        # User have chosen Hikari, block refers user to AUR helper to install Hikari for them.
                        echo "You have picked Hikari, Hikari cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    7)

                        # User have chosen Liri Shell, block refers user to AUR helper to install Liri Shell for them.
                        echo "You have picked Liri Shell, Liri Shell cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    8)

                        # User have chosen Wayfire, block refers user to AUR helper to install Wayfire for them.
                        echo "You have picked Wayfire, Wayfire cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    9)

                        # User have chosen Wio, block refers user to AUR helper to install Wio for them.
                        echo "You have picked Wio, Wio cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read STACKINGAUR
                        case "$STACKINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    10)

                        # User have chosen to install no Stacking Compositor.
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;
                esac
            ;;

            2)

                # User have chosen a Tiling Compositor, block asks which one the user wishes to install.
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

                        # User have chosen Niri, block installs Niri for user.
                        echo "You have picked Niri, installing."
                        sudo pacman -S --noconfirm niri
                        echo "Niri have been installed."
                        echo "Press Enter to continue"
                        read
                    ;;

                    2)

                        # User have chosen Qtile, block installs Qtile for user.
                        echo "You have picked Qtile, installing."
                        sudo pacman -S --noconfirm qtile
                        echo "Qtile have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    3)

                        # User have chosen Sway, block installs Sway for user.
                        echo "You have picked Sway, installing."
                        sudo pacman -S --noconfirm sway
                        echo "Sway have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    4)

                        # User have chosen Cagebrak, block refers user to AUR helper to install Cagebrak for them.
                        echo "You have picked Cagebreak, Cagebreak cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    5)

                        # User have chosen Miracle-wm, block refers user to AUR helper to install Miracle-wm for them.
                        echo "You have picked Miracle-wm, Miracle-wm cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    6)

                        # User have chosen SwayFx, block refers user to AUR helper to install SwayFx for them.
                        echo "You have picked SwayFx, SwayFx cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    7)

                        # User have chosen Velox, block refers user to AUR helper to install Velox for them.
                        echo "You have picked Velox, Velox cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read TILINGAUR
                        case "$TILINGAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    8)

                        # User have chosen to install no Tiling Compositor.
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;                    
                esac
            ;;
                
            3)

                # User have chosen a Dynamic Compositor, block asks which one the user wishes to install.
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

                        # User have chosen Hyprland, block installs Hyprland for user.
                        echo "You have picked Hyprland, installing."
                        sudo pacman -S --noconfirm hyprland
                        echo "Hyprland have been installed."
                        echo "Press Enter to continue"
                        read
                    ;;

                    2)

                        # User have chosen River, block installs River for user.
                        echo "You have picked River, installing."
                        sudo pacman -S --noconfirm river
                        echo "River have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    3)

                        # User have chosen Dwl, block refers user to AUR helper to install Dwl for them.
                        echo "You have picked Dwl, Dwl cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read DYNAMICAUR
                        case "$DYNAMICAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    4)

                        # User have chosen Japokwm, block refers user to AUR helper to install Japokwm for them.
                        echo "You have picked Japokwm, Japokwm cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read DYNAMICAUR
                        case "$DYNAMICAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    5)

                        # User have chosen Vivarium, block refers user to AUR helper to install Vivarium for them.
                        echo "You have picked Vivarium, Vivarium cannot be installed with pacman and will need you to"
                        echo "install it with AUR-helper, do you wish to boot the script to do so? YES/NO"
                        read DYNAMICAUR
                        case "$DYNAMICAUR" in
                        "YES" | "Y" | "yes" | "y" | "Yes" | "yEs" | "yeS" | "yES" | "YEs" | "YeS")

                            # User have chosen Yes to boot AUR helper script.
                            echo "You have chosen YES, Booting AUR_Helper script"
                            ./AUR_Helper.sh
                        ;;

                        "NO" | "N" | "no" | "n" | "No" | "nO")

                            # User have chosen No to boot AUR helper script.
                            echo "You have said no to booting AUR helper, continueing installation script."
                            echo "Press Enter to continue"
                            read
                        ;;
                        esac
                    ;;

                    6)

                        # User have chosen to install no Dynamic Compositor.
                        echo "You have picked None, you'll have to reload the script or manually install a GUI."
                        echo "Press Enter to continue."
                        read 
                    ;;
                esac
            ;;

            4)

                # User have chosen a Other Compositor, block asks which one the user wishes to install.
                echo "You have picked an Other Compositor, whcih one do you wish for?"
                echo "1 - Cage"
                echo "2 - Phoc"
                echo "3 - none"
                echo "Number 3 thru 5 is AUR specific and will require you to run the script again and install them thru that,"
                echo "or to manually install them, if 6 is picked no gui will be installed and script have to be ran again or manually install it."
                read OTHER
                case "$OTHER" in
                    1)

                        # User have chosen Cage, block installs Cage for user.
                        echo "You have picked Cage, installing."
                        sudo pacman -S --noconfirm cage
                        echo "Cage have been installed."
                        echo "Press Enter to continue"
                        read
                    ;;

                    2)

                        # User have chosen Phoc, block installs Phoc for user.
                        echo "You have picked Phoc, installing."
                        sudo pacman -S --noconfirm phoc
                        echo "Phoc have been installed." 
                        echo "Press Enter to continue"
                        read
                    ;;

                    3)

                        # User have chosen to install no Other Compositor.
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

        # User have chosen to use xwayland and goes thru the installation of it.
        echo "Installing xwayland"
        sudo pacman -S --noconfirm xorg-xwayland
        echo "Xwayland have been installed."
        echo "Press Enter to continue."
        read
    ;;

    4)

        # User have chosen not to have any GUI installed on their Arch install.
        echo "You have chosen no GUI, this means you have to reboot the script or install one manually if you wish for one"
    ;;
esac