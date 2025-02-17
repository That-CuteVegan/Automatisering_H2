#!/bin/bash

# Child script of Partitioning_Script.sh runs the partition script after the parent script have determined if they want to do it or not.

# Acknowlege partitioning.sh is booted
echo "partitioning.sh have booted, press enter to continue"
read

swap_root=""
Ready2=""
disk_for_partitioning=""
partition_size=""
partition_size2=""

echo "ok here we go, no going back, press enter"
read

# Determins if we start with swap or root, home will be made with rest of the drive.
until [[ "$swap_root" == swap || "$swap_root" == root ]]; do
echo "what do we make first? 'swap' or 'root'?"
read swap_root

	# Takes the user input and runs it in to an algorythem that asks further questions.
	case $swap_root in
		
		# If the user wishes to start with swap partition it starts here.
		"swap")
			echo "You have chosen $swap_root"

			until [[ "$Ready2" == "YES" ]]; do

				until [[ "$disk_for_partitioning" =~ ^sd[a-z]$ ]]; do

					# Lists block discs on system and asks user which one they wishes to use from sda to sdz.
					lsblk
						echo "what drive do you want to use for partitioning, please write in lowercase 'fx sda, sdb, sdc, ...'":
						read disk_for_partitioning

						# Uses user input to look for the disck they have picked and ask if that is the correct disc they wishes to partition.
						case $disk_for_partitioning in
	
							sd[a-z])
								echo "The chosen disck is $disk_for_partitioning, is this correct? YES/NO"
								read Ready2
								case "$Ready2" in
									
									# If it is "Yes" aka right disc then the partitioning start, if "NO" or not a valid input the system loop will reboot and ask them again.
									YES)
										echo "You have chosen 'YES', partitioning will start now."
										echo -e "o\nw" | fdisk /dev/$disk_for_partitioning

										# Asks the user how big they want the swap partitioning and asks them to write it in numbers coculated out from gigabites and not tera or peta bites.
										until [[ "$partition_size" -ge 0 && "$partition_size" -le 9999999999 ]]; do
											echo "How big do you want the $swap_root partiton? Please write only the number fx. 50G = 50, 20G = 20, and please coculate it in to gigabites and not tera or peta bites"
											read partition_size
										done

										# After taking the users input the script uses it to partition a disc section in the selected size for swap.							
										echo -e "n\np\n1\n\n+$partition_sizeG\nw" | fdisk /dev/$disk_for_partitioning

										# Asks the user how big they want their root partition and asks them to write it in numbers coculated out from gigavites and not tera or peta bites.
										until [[ "$partition_size2" -ge 0 && "$partition_size2" -le 9999999999]]
											echo "How big do you want the root partition? Please write only the number fx. 50G = 50, 20G = 20, and please coculate it in to gigabites and not tera or peta bites"
											read partition_size2
										done

										# After taking the users input the script uses it to partition a disc section in the selected size for root.
										echo -e "n\np\n2\n\n+$partition_size2G\nw" | fdisk /dev/$disk_for_partitioning

										# Creates boot directory.
										echo "Creating boot partiotn og 1GB."
										echo -e "n\np\n4\n\n+1G\nb\n" | fdisk /dev/$disk_for_partitioning

										# Takes the reminder of the drive and partition it for home.
										echo "Creating home partition from rest of the drive"
										echo -e "n\np\n3\n\n\n" | fdisk /dev/$disk_for_partitioning

										# Writes the partitions to table.
										partprobe /dev/$disk_for_partitioning

										# Makes swap partition in to actual swap.
										mkswap ${/dev/$disk_for_partitioning}1

										# Turns swap on, on the swap partiton.
										swapon ${/dev/$disk_for_partitioning}1
										
										# Formats root partiton to ext4.
										mkfs.ext4 ${/dev/$disk_for_partitioning}2

										# Formats home partition to ext4.
										mkfs.ext4 ${/dev/$disk_for_partitioning}3

										# Formats boot partition to fat32
										mkfs.fat -F32 ${/dev/$disk_for_partitioning}4

										# Mounts the drives in their respectory places
										mount ${/dev/$disk_for_partitioning}2 /mnt

										# Makes directory for boot partition
										mkdir /mnt/boot

										# Makes directory for home partiton
										mkdir /mnt/home

										# Mounts boot in directory
										mount ${/dev/$disk_for_partitioning}4 /mnt/boot

										# Mount home in directory
										mount ${/dev/$disk_for_partitioning}3 /mnt/home

										export ${/dev/$disk_for_partitioning}2
										
										brake	
									;;

									# If user says no that it is not the disc they wishes to partition it loops back to chosing what disc they want to partiton.
									NO)
										echo "You have chosen 'NO', please chose a new drive for partitioning."
									;;

									# Any other input other than sda - sdz is not a valid input and will be looped back to chosing what disc they want to partiotn.
									*)
										echo "That's not a valid input, please chose a new drive to partition."
									;;
								esac
							;;

							*)
								echo "That's not a valid input, please try again."
							;;
						done
					done
				esac
			brake
		;;

		# If the user wishes to start with root partition it starts here.
		"root")
			
			echo "You have chosen $swap_root"

			until [[ "$Ready2" == "YES" ]]; do

				until [[ "$disk_for_partitioning" =~ ^sd[a-z]$ ]]; do

					# lists block discs on system and asks user which one they wishes to use from sda to sdz.
					lsblk
					echo "what drive do you want to use for partitioning, please write in lowercase 'fx sda, sdb, sdc, ...'":
					read disk_for_partitioning
						
						# Uses user input to look for the disck they have picked and ask if that is the correct disc they wishes to partition.
						case $disk_for_partitioning in
	
							sd[a-z])
								echo "The chosen disck is $disk_for_partitioning, is this correct? YES/NO"
								read Ready2
								case "$Ready2" in

										# If it is "Yes" aka right disc then the partitioning start, if "NO" or not a valid input the system loop will reboot and ask them again.
										*"YES"*)
											echo "You have chosen 'YES', partitioning will start now."
											echo -e "o\nw" | fdisk /dev/$disk_for_partitioning
										
											# Asks the user how big they want the root partitioning and asks them to write it in numbers coculated out from gigabites and not tera or peta bites.
											until [[ "$partition_size" -ge 0 && "$partition_size" -le 9999999999 ]]; do
												echo "How big do you want the $swap_root partiton? Please write only the number fx. 50G = 50, 20G = 20, and please coculate it in to gigabites and not tera or peta bites"
												read partition_size
											done
										
											# After taking the users input the script uses it to partition a disc section in the selected size for root.
											echo -e "n\np\n2\n\n+$partition_sizeG\nw" | fdisk /dev/$disk_for_partitioning

											# Asks the user how big they want their swap partition and asks them to write it in numbers coculated out from gigavites and not tera or peta bites.
											until [[ "$partition_size2" -ge 0 && "$partition_size2" -le 9999999999
												echo "How big do you want the swap partition? Please write only the number fx. 50G = 50, 20G = 20, and please coculate it in to gigabites and not tera or peta bites"
												read partition_size2
											done
										
											# After taking the users input the script uses it to partition a disc section in the selected size for swap.
											echo -e "n\np\n1\n\n+$partition_size2G\nw" | fdisk /dev/$disk_for_partitioning

											# Creates boot directory.
											echo "Creating boot partiotn og 1GB."
											echo -e "n\np\n4\n\n+1G\nb\n" | fdisk /dev/$disk_for_partitioning

											# Takes the reminder of the drive and partition it for home.
											echo "Creates home partiton from rest of drive"
											echo -e "n\np\n3\n\n\nw" | fdisk /dev/$disk_for_partitioning

											# Writes the partitions to table.
											partprobe /dev/$disk_for_partitioning

											# Makes swap partition in to actual swap.
											mkswap ${/dev/$disk_for_partitioning}1

											# Turns swap on, on the swap partiton.
											swapon ${/dev/$disk_for_partitioning}1

											# Formats root partiton to ext4.
											mkfs.ext4 ${/dev/$disk_for_partitioning}2

											# Formats home partition to ext4.
											mkfs.ext4 ${/dev/$disk_for_partitioning}3

											# Formats boot partition to fat32
											mkfs.fat -F32 ${/dev/$disk_for_partitioning}4

											# Mounts the drives in their respectory places
											mount ${/dev/$disk_for_partitioning}2 /mnt

											# Makes directory for boot partition
											mkdir /mnt/boot

											# Makes directory for home partiton
											mkdir /mnt/home

											# Mounts boot in directory
											mount ${/dev/$disk_for_partitioning}4 /mnt/boot

											# Mount home in directory
											mount ${/dev/$disk_for_partitioning}3 /mnt/home

											export ${/dev/$disk_for_partitioning}2
										
											brake	
										;;
									
										# If the user choses 'NO' that it is not the right drive the loop will start a new with them chosing drive.
										*"NO"*)
											echo "You have chosen 'NO', please chose a new drive for partitioning."
										;;

										# Anything else other than 'YES' or 'No' is not a valid input and will start the loop back a new.
										*)
											echo "That's not a valid input, please chose a new drive to partition."
										;;
								esac
							;;

							# Anything other than root or swap is not a vailed input and will start the loop anew.
							*)
								echo "That's not a valid input, please try again."
							;;
						done
					done
				esac
			brake
		;;

	
		*)
			echo "That's not a valid input, please try again".
		;;
	esac
done