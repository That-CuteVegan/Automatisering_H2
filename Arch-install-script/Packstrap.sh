#!/bin/bash

# Script to packstrap and install Arch on to your system.

# Acknowlege Packstrap.sh is booted
echo "Packstrap.sh have booted, press enter to continue"
read

# launches packstrap commando
echo "Strap in and get ready"
pacstrap -K /mnt base linux linux-firmware base-devel

echo "Touch down, you are welcome to unbuclke your seatbelt now"