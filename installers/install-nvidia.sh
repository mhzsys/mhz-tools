#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
# echo '            MEGAHURTZ SYSTEMS'
./scripts/header-mhzsys.sh
echo '       Nvidia easy install for Ubuntu'
sleep 1

echo 'Pulling updates'
sudo apt-get update

echo 'Adding ppa for graphics drivers'
sudo add-apt-repository ppa:graphics-drivers/ppa

echo 'Updatting repository'
sudo apt-get update

echo 'Available drivers'
sudo ubuntu-drivers list

echo 'type the drive you wish to install:'
read selDriver
echo 'downloading and installing latest Nvidia driver'
sudo apt-get install ${selDriver}

echo 'Nvidia Grapics installation complete'
echo 'Please restart computer to take effect'
echo 'type yes or y to restart now'
read restart
if [ $restart = 'yes' ] || [ $restart = 'y' ]; then
  echo 'restarting system'
  sleep 1
  sudo reboot
else
  echo 'please reboot system later'
fi

# Return to main menu
echo 'press enter to return to menu'
while true
do
  read -s -n 1 key  # -s: do not echo input character. -n 1: read only 1 character (separate with space)

# double brackets to test, single equals sign, empty string for just 'enter' in this case...
# if [[ ... ]] is followed by semicolon and 'then' keyword
  if [[ $key = "" ]]; then 
    # echo 'You pressed enter!'
    ./installers/installer-menu.sh
  else
    echo "'$key' is not a valid option."
  fi
done