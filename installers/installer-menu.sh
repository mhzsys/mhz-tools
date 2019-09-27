#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '              INSTALLERS MENU '
sleep 1

echo 'Easy Installers'
echo '*******************************************'
echo '* htop    * tracert * vbox    * tweaks    *'
echo '* glances * nodejs  * steam   * handbrake *'
echo '* bmon    * chrome  * hwinfo  * freecad   *'
echo '* wavemon * vscode  * nvidia  * openscad  *'
echo '* exfat   *         *         *           *'
echo '*******************************************'
echo 'type menu to return to main menu'

echo ''
while true
do
  read option
  if [ $option = 'htop' ]; then
    ./installers/install-htop.sh
  elif [ $option = 'glances' ]; then
    ./installers/install-glances.sh
  elif [ $option = 'bmon' ]; then
    ./installers/install-bmon.sh
  elif [ $option = 'wavemon' ]; then
    ./installers/install-wavemon.sh
  elif [ $option = 'tracert' ]; then
    ./installers/install-mtr.sh
  elif [ $option = 'nodejs' ]; then
    ./installers/install-node.sh
  elif [ $option = 'chrome' ]; then
    ./installers/install-chrome.sh
  elif [ $option = 'vscode' ]; then
    ./installers/install-vscode.sh
  elif [ $option = 'vbox' ]; then
    ./installers/install-vbox.sh
  elif [ $option = 'steam' ]; then
    ./installers/install-steam.sh
  elif [ $option = 'hwinfo' ]; then
  ./installers/install-hwinfo.sh
  elif [ $option = 'nvidia' ]; then
  ./installers/install-nvidia.sh
  elif [ $option = 'tweaks' ]; then
  ./installers/install-tweaks.sh
  elif [ $option = 'handbrake' ]; then
  ./installers/install-handbrake.sh
  elif [ $option = 'freecad' ]; then
  ./installers/install-freecad.sh
  elif [ $option = 'openscad' ]; then
  ./installers/install-openscad.sh
  elif [ $option = 'exfat' ]; then
  ./installers/install-exfat.sh
  elif [ $option = 'menu' ]; then
    ./menu.sh
  else
    echo 'Not a valid option.'
  fi
done