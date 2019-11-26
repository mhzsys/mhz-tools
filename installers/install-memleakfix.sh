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
echo '       Gnome Memory Leak Fix'
sleep 1

# https://discourse.ubuntu.com/t/help-test-memory-leak-fixes-in-18-04-lts/5251

echo 'Downloading fix deb packages'
wget https://launchpad.net/ubuntu/+source/gjs/1.52.1-1ubuntu1/+build/14773965/+files/gjs_1.52.1-1ubuntu1_amd64.deb 
wget https://launchpad.net/ubuntu/+source/gjs/1.52.1-1ubuntu1/+build/14773965/+files/libgjs-dev_1.52.1-1ubuntu1_amd64.deb
wget https://launchpad.net/ubuntu/+source/gjs/1.52.1-1ubuntu1/+build/14773965/+files/libgjs0g_1.52.1-1ubuntu1_amd64.deb

echo 'Installing deb packages'
sudo dpkg -iO gjs_1.52.1-1ubuntu1_amd64.deb libgjs-dev_1.52.1-1ubuntu1_amd64.deb libgjs0g_1.52.1-1ubuntu1_amd64.deb

echo 'Removing package installers'
sudo rm -rf gjs_1.52.1-1ubuntu1_amd64.deb libgjs-dev_1.52.1-1ubuntu1_amd64.deb libgjs0g_1.52.1-1ubuntu1_amd64.deb

echo 'Gnome Memory Leak Fix Installed'
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