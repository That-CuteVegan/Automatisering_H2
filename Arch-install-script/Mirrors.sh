#!/bin/bash

# Script til at updatere pacman mirrors.

# Acknowlege Mirror.sh is booted
echo "Mirror.sh have booted, press enter to continue"
read

# Copies the mirrorlist and makes a backup of it.
echo "Copies mirrorlist as backup"
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup

# Installs rankmirrors program
sudo pacman -S --noconfirm pacman-contrib

# Configures your mirrorlist depending on where you are in the world
echo "Configures mirrorlist"
rankmirrors -n 6 /etc/pacman.d/mirrorlist.backup > /etc/pacman.d/mirrorlist

# Mirrorlist is done.
echo "Mirrorlist have been configured"