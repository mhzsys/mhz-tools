#!/bin/bash

clear
echo '  __  __ _    _ ______ _______     _______ '
echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
echo '          MEGAHURTZ SYSTEMS MENU '
echo '           version v0.1.3 beta'
sleep 1

echo 'Tools options'
echo '**********'
echo '*update  *'
echo '*sysinfo *'
echo '*battery *'
echo '*screen  *'
echo '**********'

echo ''
read option
if [ $option = 'update' ]; then
  ./update.sh
elif [ $option = 'sysinfo' ]; then
  ./sysinfo.sh
elif [ $option = 'battery' ]; then
  ./battery.sh
elif [ $option = 'screen' ]; then
  ./screen.sh
fi