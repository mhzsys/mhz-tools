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
echo '* update  * htop    * tracert * adduser   *'
echo '* sysinfo * glances * zpool   * monitor   *'
echo '* battery * wavemon * PTest   * notes     *'
echo '* screen  * bmon    * netdata * install   *'
echo '*******************************************'

echo ''
while true
do
  read option
  if [ $option = 'update' ]; then
    ./scripts/update.sh
  elif [ $option = 'sysinfo' ]; then
    ./scripts/sysinfo.sh
  elif [ $option = 'netdata' ]; then
    ./scripts/update_netdata.sh
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
  elif [ $option = 'zpool' ]; then
    ./scripts/zfsCheck.sh
  elif [ $option = 'install' ]; then
    # echo 'installer hit'
    ./installers/installer-menu.sh
  elif [ $option = 'tracert' ]; then
    ./scripts/tracert.sh
  elif [ $option = 'adduser' ]; then
    ./scripts/add_new_local_user.sh
  elif [ $option = 'notes' ]; then
    # echo 'installer hit'
    ./notes/notes-menu.sh
  elif [ $option = 'PTest' ]; then
    # echo 'installer hit'
    ./performance_test/pt_run.sh
  elif [ $option = 'monitor' ]; then
    # echo 'installer hit'
    ./monitor/monitor-menu.sh
  else
    echo 'Not a valid option.'
  fi
done