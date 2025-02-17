#!/bin/bash

# Script to install arch linux on your system, need to be booted in to UEFI.
Export_Command=$(which export)
User_Name=""
country=""
timezone=""
Hostname=""
root_password=""
confirm_root_password=""
username=""
networkcard=""

# Updates pacman package list
sudo pacman -Syu

# Welcomes you to my script and asks for your name.
echo "Welcome to my ArchLinux installation script. Please enter your name:"
read User_Name

until [[ "$Ready_Install" == YES || "$Ready_Install" == NO ]]; do

	# Uses username to ask if they are ready to procead.
	echo "Hi $User_Name, Ready to install some Arch on this system? YES/NO"
	read Ready_Install

	# Users users ready input to look for a case and either boot a child script or loop back to asking if ready.
	case $Ready_Install
	
		YES)
			echo "Lets check if you have booted in UEFI (press enter)."
			read

			# Boots script thats going to check for if user is booted in UEFI.
			echo "Booting EFI_VAR.sh"
			./EFI_VAR.sh

			# Exports the variable 'User_Names'
			export User_Name

			# Boots script to partition and mount discks
			echo "Booting Partitioning_Script.sh"
			echo "Grate, now that we know you have booted in UEFI we can continue, if not please press 'CTRL' and 'C' at the same time to stop the script else press enter to continue"
			read
			./Partitioning_Script.sh

			# Boots script that makes a copy of pacman mirrors list and updates it
			echo "Now we have the storage partiton's handeld now it is time to continue on to make mirror lists"
			echo "Booting Mirrors.sh"
			./Mirrors.sh

			# Boots script for packstrapping aka installing the system.
			echo "With mirrorlist done time to strap in"
			echo "Booting Packstrap.sh"
			./Packstrap.sh

			# Boots script for f-stab configuration.
			echo "With instalation done time to configure f-stab."
			echo "Booting F_STAB.sh"
			./F_STAB.sh

			# Enters chroot
			echo "Enters chroot for final setup"
			arch-chroot /mnt

			# Installs nano and bash-completion
			sudo pacman -S --nocinfirm nano bash-completion

			# Sets up your locale for you
			sed -i 's/^#en_US.UTF-8 UTF-8$/en_US.UTF-8 UTF-8/' /etc/locale.gen

			# Generates your locale
			clear
			echo "Generating locale"
			locale-gen
			echo LANG=en_US.UTF-8 > /etc/locale.conf
			$Export_Command LANG=en_US.UTF-8
			echo "locale have been generated"
			read

			# Generates time zone
			clear
			echo "Generating time zone."
			ls /usr/share/zoneinfo/
			read -P "What is your contry to further elaburate timezones? (Case sensetive)" country
			clear
			ls /usr/share/zoneinfo/$country/
			read -P "What region of the country is your timezone? (Case sensetive)" timezone
			clear
			ln -S /usr/share/zoneinfo/$country/$timezone > /etc/localtime
			hwclock --systohc --utc
			echo "Timezone have been generated"
			read
			
			# Generate system hostname
			clear
			echo "Generate Hostname."
			read -P "What hostname do you wish your system to have?" Hostname
			echo $Hostname > /etc/hostname
			echo "Hostname have now been generated."
			read

			# enables trim support for ssd's
			systemctl enable fstrim.timer

			# Pacman 32bit support
			clear
			echo "Enabling 32 bit support"
			sed -i 's/^#[multilib]$/[multilib]/' /etc/pacman.conf
			sed -i 's/^#Include = /etc/pacman.d/mirrorlist$/Include = /etc/pacman.d/mirrorlist/' /etc/pacman.conf
			sudo pacman -Sy
			echo "32 bit support is now enabled"
			read

			# Set root password
			clear
			echo "Time to generate a root password"
			echo "Booting Set_root_password.sh"
			./Set_root_password.sh

			# Adds a user to the system
			clear
			echo "Time to add a user to the system."
			read -P "What username should the new user have:" username
			useradd -m -g users -G wheel,storage,power -s /bin/bash $username
			echo "User have been made, time to give it a password"
			export $username
			./Set_user_password.sh

			# Configures visudo to make it so root password for sudo commands will only be asked once.
			sed -i 's/^# %wheel ALL=(ALL:ALL) ALL$/%wheel ALL=(ALL:ALL) ALL/' /etc/sudoers
			echo "Defaults rootpw" | sudo tee -a /etc/sudoers > /dev/null

			# Time to install boot loader
			clear
			echo "Time to install bootloader."
			bootctl install
			echo "Bootloader have been installed, time to write the boot script."
			read
			cat <<EOF "/boot/loader/entries/arch.conf"
			title Arch
			linux /vmlinuz-linux
			initrd /initramfs-linux.img
			
			EOF

			source ./partitioning.sh

			echo "options root=PARTUUID=$(blkid -s PARTUUID -o value ${/dev/$disk_for_partitioning}2) rw" >> /boot/loader/entries/arch.conf
			cat /boot/loader/entries/arch.conf
			read

			# DHCP service configuration for internet.
			clear
			echo "Time to set up some DHCP services"
			read
			ip link
			read -P "What network driver are you using?:" networkcard
			sudo pacman -S --noconfirm dhcpcd
			sudo systemctl enable dhcpcd@$networkcard.service
			sudo pacman -S --noconfirm networkmanager
			sudo systemctl enable NetworkManager.service

			# Graphics card compatibilety

			# Installation script is done
			clear
			echo "Now the installation script is done running and it is time to boot in to your installation."
			read
			exit
			umount -R /mnt
			echo "Now the mount and anything under it have been unmounted and the system is ready to reboot, type the command 'reboot', once the command have been ran pull out your installation medium."
			echo "Thank your for using my script."

		;;

		NO)
			echo "You have picked 'NO'. Installation script closing"
		
		;;

		*)
			echo "You have picked $Ready_Install, that is not a valid input, please try again"
		
		;;
	esac
done