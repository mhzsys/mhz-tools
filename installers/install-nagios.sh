#!/bin/bash

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
# echo '            MEGAHURTZ SYSTEMS'
./scripts/header-mhzsys.sh
echo '    Nagios Ubuntu Updates Check'
sleep 1

echo 'installing checks'
#!/bin/bash

#sudo nano /etc/systemd/system/update_check.service
echo "creating service"

echo "[Unit]" >> /etc/systemd/system/update_check.service
echo "After=network.target" >> /etc/systemd/system/update_check.service
echo "" >> /etc/systemd/system/update_check.service
echo "[Service]" >> /etc/systemd/system/update_check.service
echo "ExecStart=/usr/local/bin/update_check.sh" >> /etc/systemd/system/update_check.service
echo "" >> /etc/systemd/system/update_check.service
echo "[Install]" >> /etc/systemd/system/update_check.service
echo "WantedBy=default.target" >> /etc/systemd/system/update_check.service

echo "generating script"

echo "#!/bin/bash
# Version: 0.2 beta
# Updated: 2020-10-25
# Written by: Nick Damberg
# Perfected by: No one
# This only works in Ubuntu

# Get version of ubuntu for formatting.
# Release:        18.04
version_info=$(lsb_release -r | awk '{print $2}')
#echo \$version_info

while :
do
   # 18 packages can be updated. 0 updates are security updates.
   updates=$(sudo cat /var/lib/update-notifier/updates-available)

   software=$(echo \$updates | awk '{print $1}')
   echo \"software updates: \"\$software > /tmp/update_status.txt
   
   if [ \$version_info == \"18.04\" ]; then
   	security=$(echo \$updates | awk '{for (I=1;I<=NF;I++) if ($I == "updated.") {print $(I+1)};}')
   	echo \$version_info
   	echo \"security updates: \"\$security >> /tmp/update_status.txt
   elif [ \$version_info == \"20.04\" ]; then
   	security=$(echo \$updates | awk '{for (I=1;I<=NF;I++) if ($I == "immediately.") {print $(I+1)};}')
   	echo \$version_info
   	echo \"security updates: \"\$security >> /tmp/update_status.txt
   else
   	echo \"Error: Ubuntu Version\"
   	echo \"security updates: error\" >> /tmp/update_status.txt
   fi
     

   if [ -f /var/run/reboot-required ]; then
       echo \"Restart: Yes\" >> /tmp/update_status.txt
   else
       echo \"Restart: No\" >> /tmp/update_status.txt
   fi
   sleep 28800
done" >> /usr/local/bin/update_check.sh

chmod 744 /usr/local/bin/update_check.sh
chmod 664 /etc/systemd/system/update_check.service
systemctl daemon-reload
systemctl enable update_check.service

systemctl start update_check.service

echo "DONE"
sleep 1

systemctl status update_check.service


echo 'Node installation complete'

# Return to main menu
echo 'press enter to return to menu'
while true
do
  read -s -n 1 key  # -s: do not echo input character. -n 1: read only 1 character (separate with space)

# double brackets to test, single equals sign, empty string for just 'enter' in this case...
# if [[ ... ]] is followed by semicolon and 'then' keyword
  if [[ $key = "" ]]; then 
    # echo 'You pressed enter!'
    ./installers/installer-menu.sh
  else
    echo "'$key' is not a valid option."
  fi
done