#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '                NOTES MENU '
sleep 1

echo 'Notes options'
echo '*******************************************'
echo '* tweaks  *         *         *           *'
echo '*         *         *         *           *'
echo '*         *         *         *           *'
echo '*         *         *         *           *'
echo '*******************************************'
echo 'type menu to return to main menu'

echo ''
while true
do
  read option
  if [ $option = "tweaks" ]; then
    cat notes/tweaks.txt
  elif [ $option = "none" ]; then
    echo "place holder"
  elif [ $option = 'menu' ]; then
    ./menu.sh
  else
    echo 'Not a valid option.'
  fi
done