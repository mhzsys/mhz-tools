#!/bin/bash

clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '            Fix screen rotation'
sleep 1

# Fixes screen rotation
xrandr -o normal

# Stops and removes the screen rotation sensors
echo 'Would you like to perminantly disable auto rotate sensors?'
echo 'Type y or yes if you would.'
read disable
if [ $disable = 'yes' ] || [ $disable = 'y' ]; then
  echo 'Disabling rotation sensors'
  sudo systemctl stop iio-sensor-proxy.service
  sudo systemctl disable iio-sensor-proxy.service
  sudo apt-get remove iio-sensor-proxy
  echo 'Rotation sensors disabled'
else
  echo ''
fi


# Another option for disabeling screen rotation in gnome
#gsettings set org.gnome.settings-daemon.plugins.orientation active false

# Command for changing screen resolution
#xrandr --output default --mode 1366x768

clear
echo 'Screen has been fixed, have a nice day.'

# Return to main menu
echo 'press enter to return to menu'
while true
do
  read -s -n 1 key  # -s: do not echo input character. -n 1: read only 1 character (separate with space)

# double brackets to test, single equals sign, empty string for just 'enter' in this case...
# if [[ ... ]] is followed by semicolon and 'then' keyword
  if [[ $key = "" ]]; then 
    # echo 'You pressed enter!'
    ./menu.sh
  else
    echo "'$key' is not a valid option."
  fi
done