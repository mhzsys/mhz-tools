#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '        Slack Easy Installer '
sleep 1

mkdir -p installers/tmp

echo 'Downloading slack Installer'
cd installers/tmp/
wget https://downloads.slack-edge.com/linux_releases/slack-desktop-4.0.2-amd64.deb

echo 'setting file permissions'
sudo chmod +x slack-desktop-4.0.2-amd64.deb

echo 'installing Slack'
sudo apt install ./slack-desktop-*.deb

echo 'removing installer'
rm -rf slack-desktop-4.0.2-amd64.deb

echo 'Slack Install Complete'
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