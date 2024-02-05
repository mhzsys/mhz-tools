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
echo '  Node and MongoDB easy install for Debian'
sleep 1

echo 'Pulling updates'
sudo apt-get update

echo 'Installing CURL'
sudo apt-get install gnupg curl

#Import mogodb public GPG key
curl -fsSL https://www.mongodb.org/static/pgp/server-7.0.asc | sudo gpg -o /usr/share/keyrings/mongodb-server-7.0.gpg --dearmor

# https://www.mongodb.com/docs/manual/tutorial/install-mongodb-on-ubuntu/

#Detecting ubuntu versoin
RELEASE=$(cat /etc/lsb-release | grep "DISTRIB_RELEASE")
echo $RELEASE

echo 'Downloading packages'
if [$RELEASE = 'DISTRIB_RELEASE=20.04']; then
  echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu focal/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
elif [$RELEASE = 'DISTRIB_RELEASE=22.04']; then
  echo "deb [ arch=amd64,arm64 signed-by=/usr/share/keyrings/mongodb-server-7.0.gpg ] https://repo.mongodb.org/apt/ubuntu jammy/mongodb-org/7.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-7.0.list
else
  echo "Version not currently supported"
fi

echo 'Reloading packages'
sudo apt-get update

echo 'Installing MogoDB'
sudo apt-get install -y mongodb-org

echo 'Starting MongoDB'
sudo systemctl start mongod

echo 'MongoDB installation complete'

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