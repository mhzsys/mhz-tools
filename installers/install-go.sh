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
echo '    Golang easy install for Debian'
sleep 1

echo 'Pulling updates'
sudo apt-get update

echo 'Downloading packages'
cd /tmp
wget https://golang.org/dl/go1.16.5.linux-amd64.tar.gz

echo 'Extracing Golang'
sudo tar -C /usr/local -xzf go1.16.5.linux-amd64.tar.gz

echo 'Installing bashrc exports'

echo "" >> ~/.bashrc
echo "# Golang" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOROOT/bin" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export GOPATH=/home/ndamberg/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOPATH/bin" >> ~/.bashrc

source ~.bashrc

cd ~
mkdir go
cd go
mkdir bin pkg src
mkdir src/github.com

echo "What is your Github username:"
read ghuser

mkdir src/github.com/$ghuser

cd ~/mhz-tools
echo 'Golang installation complete'

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