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

echo 'Checking for availabe drivers'
apt-cache search nvidia-driver

echo 'Ubuntu 16.04 = nvidia-384 | 18.04 = nvidia-driver-390'
echo 'Which Version of ubuntu are you running 16.04 or 18.04?'

do
  read option
  if [ $option = '16.04' ]; then
    sudo apt install nvidia-384
  elif [ $option = '18.04' ]; then
    sudo apt install nvidia-driver-390
  else
    echo 'Not a valid option.'
  fi

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