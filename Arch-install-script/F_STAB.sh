#!/bin/bash

# Script to generate fstab configuration

# Acknowlege F_STAB.sh is booted
echo "F_STAB.sh have booted, press enter to continue"
read

# Generates the fstab file
echo "Generating fstab file"
genfstab -U -p /mnt >> /mnt/etc/fstab

echo "fstab file have been generated in '/mnt/etc/fstab'"