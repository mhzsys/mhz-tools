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
echo '    Node and NPM easy install for Debian'
sleep 1

echo 'Pulling updates'
sudo apt-get update

echo 'Installing CURL'
sudo apt-get install curl

echo 'Downloading packages'
curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -

echo 'Installing Node and NPM'
sudo apt-get install -y nodejs

echo 'Node installation complete'