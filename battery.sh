#!/bin/bash
# beta v0.1.1

clear
echo '  __  __ _    _ ______ _______     _______ '
echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
echo '             MEGAHURTZ SYSTEMS'
echo '          Checking Battery Status'
echo '            version v0.1.2 beta'
sleep 1

upower -i /org/freedesktop/UPower/devices/battery_BAT0
