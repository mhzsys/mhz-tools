#!/bin/bash

echo '  __  __ _    _ ______ _______     _______ '
echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
echo '      MEGAHURTZ SYSTEMS UPDATE SCRIPT '
echo '           version v0.4.4 beta'
sleep 2

echo ' Updating repo '
git pull origin master

sleep 1

echo 'Checking for updates'
sudo apt-get update
sudo cat /var/lib/update-notifier/updates-available
sleep 1

echo 'Installing updates'
sudo apt-get upgrade -y
sleep 1


echo 'Checking if system needs to be restarted'
if [ -f /var/run/reboot-required ]; then
  echo 'reboot required'
  echo 'type yes or y to restart now'
  read restart
  if [ $restart = 'yes' ] || [ $restart = 'y' ]; then
    echo 'restarting system'
    sleep 1
    sudo reboot
  else
    echo 'please reboot system later'
  fi
else
  echo 'no reboot required'
fi