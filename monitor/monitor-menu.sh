#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '               MONITOR MENU '
sleep 1

echo 'Monitoring Tools'
echo '*******************************************'
echo '* zpool   *         *         *           *'
echo '* nvidia  *         *         *           *'
echo '*         *         *         *           *'
echo '*         *         *         *           *'
echo '*******************************************'
echo 'type menu to return to main menu'

echo ''
while true
do
  read option
  if [ $option = "zpool" ]; then
    ./monitor/zpool.sh
  elif [ $option = "nvidia" ]; then
    ./monitor/nvidia.sh
  elif [ $option = 'menu' ]; then
    ./menu.sh
  else
    echo 'Not a valid option.'
  fi
done