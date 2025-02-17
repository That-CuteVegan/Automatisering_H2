#!/bin/bash

# Script that looks in to if system is booted in UEFI.

# Ack EFI_VAR.sh have booted
echo "EFI_VAR.sh have booted, press enter to continue"
read

# Checks if system is booted in UEFI for user
echo "checking for EFI var."
echo efivar -l
