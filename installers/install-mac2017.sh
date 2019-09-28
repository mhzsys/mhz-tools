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
echo '       MacBook 2017 hardware support'
sleep 1

# https://github.com/Dunedan/mbp-2016-linux#keyboard--touchpad

echo 'Installing Keyboard and Touchpad support'
sudo echo -e "\n# applespi\napplespi\nspi_pxa2xx_platform\nintel_lpss_pci" >> /etc/initramfs-tools/modules
sudo apt install dkms
sudo git clone https://github.com/roadrunner2/macbook12-spi-driver.git /usr/src/applespi-0.1
sudo dkms install -m applespi -v 0.1

echo 'MacBook 2017 support installation complete'

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