#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '        Google Chrome Easy Installer '
sleep 1

mkdir -p installers/tmp

echo 'Downloading Google Chrome Installer'
cd installers/tmp/
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb

echo 'setting file permissions'
sudo chmod +x google-chrome-stable_current_amd64.deb

echo 'installing google chrome'
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'removing installer'
rm -rf google-chrome-stable_current_amd64.deb

echo 'Google Chrome Install Complete'
cd ../..

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