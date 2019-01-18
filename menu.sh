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
echo '* update  * htop    * tracert *           *'
echo '* sysinfo * glances *         *           *'
echo '* battery * wavemon *         *           *'
echo '* screen  * bmon    *         *           *'
echo '*******************************************'

echo ''
while true
do
  read option
  if [ $option = 'update' ]; then
    ./scripts/update.sh
  elif [ $option = 'sysinfo' ]; then
    ./scripts/sysinfo.sh
  elif [ $option = 'battery' ]; then
    ./scripts/battery.sh
  elif [ $option = 'screen' ]; then
    ./scripts/screen.sh
  elif [ $option = 'htop' ]; then
    htop
  elif [ $option = 'glances' ]; then
    glances
  elif [ $option = 'wavemon' ]; then
    wavemon
  elif [ $option = 'bmon' ]; then
    bmon
  elif [ $option = 'tracert' ]; then
    ./scripts/tracert.sh
  else
    echo 'Not a valid option.'
  fi
done