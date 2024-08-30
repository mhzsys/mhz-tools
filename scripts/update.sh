#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '               UPDATE SCRIPT '
sleep 1

echo ' Updating repo '
git pull origin master

sleep 1

echo 'Checking for updates'
sudo apt-get update
sudo cat /var/lib/update-notifier/updates-available
sleep 1

echo 'Installing updates'
sudo apt-get upgrade -y
sleep 1

echo "Installing Distro updates"
sudo apt-get dist-upgrade -y
sleep 1

echo "Cleaning up old files"
sudo apt clean
sudo apt autoclean
sudo apt autoremove -y
sleep 1

echo "Checking/Updating Netdata"

# Function to check if netdata is installed
is_netdata_installed() {
    if [ -d "/etc/netdata" ]; then
        return 0 # Netdata is installed
    else
        return 1 # Netdata is not installed
    fi
}

# Function to update netdata
update_netdata() {
    wget -O /tmp/netdata-kickstart.sh https://get.netdata.cloud/kickstart.sh && sh /tmp/netdata-kickstart.sh
}

# Main function to check and update netdata if installed
manage_netdata() {
    if is_netdata_installed; then
        echo "Netdata is installed. Updating..."
        update_netdata
    else
        echo "Netdata is not installed."
    fi
}

# Run the manage_netdata function
manage_netdata

#apt --fix-broken install

echo 'Checking if system needs to be restarted'
if [ -f /var/run/reboot-required ]; then
  echo 'reboot required'
  echo 'type yes or y to restart now'
  read restart
  if [ $restart = 'yes' ] || [ $restart = 'y' ]; then
    echo 'restarting system'
    sleep 1
    sudo reboot
  else
    echo 'please reboot system later'
  fi
else
  echo 'no reboot required'
fi

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