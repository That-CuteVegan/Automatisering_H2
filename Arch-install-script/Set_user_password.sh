#!/bin/bash

# Script used to set a user password

user_password=""
confirm_user_password=""

echo "Time to set a user password for $username."
read
echo "Enter a password:"
read -s user_password
echo "Re-enter password to confirm it:"
read -s confirm_user_password

if ["$user_password" != "$confirm_user_password" ]; then
echo "passwords dont match, set up root password manually, exiting."
exit 1
fi

echo "$username:$user_password" | sudo chpasswd

echo "new password have now been set for $username"