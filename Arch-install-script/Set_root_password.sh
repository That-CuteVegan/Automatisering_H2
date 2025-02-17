#!/bin/bash

# Script used to set a root password

root_password=""
confirm_root_password=""

echo "Time to set a root password."
read
echo "Enter a root password:"
read -s root_password
echo "Re-enter password to confirm it:"
read -s confirm_root_password

if ["$root_password" != "$confirm_root_password" ]; then
echo "passwords dont match, set up root password manually, exiting."
exit 1
fi

echo "root:$root_password" | sudo chpasswd

echo "new password have now been set"