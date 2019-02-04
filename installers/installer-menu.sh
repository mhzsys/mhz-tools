#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '                SYSTEM MENU '
sleep 1

echo 'Tools options'
echo '*******************************************'
echo '* htop    * tracert *         *           *'
echo '* glances * nodejs  *         *           *'
echo '* bmon    *         *         *           *'
echo '* wavemon *         *         *           *'
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
  elif [ $option = 'menu' ]; then
    ./menu.sh
  else
    echo 'Not a valid option.'
  fi
done