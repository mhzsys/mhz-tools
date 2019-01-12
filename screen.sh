#!/bin/bash

clear
echo '  __  __ _    _ ______ _______     _______ '
echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
echo '             MEGAHURTZ SYSTEMS'
echo '            Fix screen rotation'
echo '            version v0.1.2 beta'
sleep 1

# Fixes screen rotation
xrandr -o normal

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
        ./menue.sh
    else
        echo "'$key' is not a valid option."
    fi
done