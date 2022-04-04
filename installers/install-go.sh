#!/bin/bash
# https://go.dev/doc/install
# https://www.digitalocean.com/community/tutorials/how-to-install-go-on-ubuntu-20-04

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
GOVERSION=$( curl "https://go.dev/VERSION?m=text" )
OS="linux"
ARCH="amd64"
sleep 1

echo 'Pulling updates'
sudo apt-get update

echo 'Downloading packages'
echo "Installing GO version: $GOVERSION"
cd /tmp
wget https://golang.org/dl/$GOVERSION.$OS-$ARCH.tar.gz

echo 'Extracing Golang'
sudo tar -C /usr/local -xzf $GOVERSION.$OS-$ARCH.tar.gz

echo 'Installing bashrc exports'

echo "" >> ~/.bashrc
echo "# Golang" >> ~/.bashrc
echo "export GOROOT=/usr/local/go" >> ~/.bashrc
echo "export PATH=$PATH:$GOROOT/bin" >> ~/.bashrc
echo "" >> ~/.bashrc
echo "export GOPATH=/usr/local/go/bin" >> ~/.bashrc
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
go version
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