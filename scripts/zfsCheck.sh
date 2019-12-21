#!/bin/bash
# beta v0.1.1

# clear
# echo '  __  __ _    _ ______ _______     _______ '
# echo ' |  \/  | |  | |___  // ____\ \   / / ____|'
# echo ' | \  / | |__| |  / /| (___  \ \_/ / (___  '
# echo ' | |\/| |  __  | / /  \___ \  \   / \___ \ '
# echo ' | |  | | |  | |/ /__ ____) |  | |  ____) |'
# echo ' |_|  |_|_|  |_/_____|_____/   |_| |_____/ '
./scripts/header-mhzsys.sh
echo '             Checking ZFS Status'
sleep 1

# Condition of array
condition=$(/sbin/zpool status | egrep -i '(DEGRADED|FAULTED|OFFLINE|UNAVAIL|REMOVED|FAIL|DESTROYED|corrupt|cannot|unrecover)')
if [ "${condition}" ]; then
#  emailSubject="$emailSubject - fault"
#  problems=1
  echo "there is a fault!"
  echo "ERROR: ${condition}"
else
  echo "No errors found in array"
fi


# Array capacity
warnCapacity=80
critCapacity=90
maxCapacity=95

capacity=$(/sbin/zpool list -H -o capacity)
for line in ${capacity//%/}
do
  if [ $line -ge $maxCapacity ]; then
     echo "OVER CAPACITY ${capacity}"
  elif [ $line -ge $critCapacity ]; then
     echo "CAPACITY IS CRITICAL ${capacity}"
  elif [ $line -ge $warnCapacity ]; then
     echo "Warning Volume is getting full ${capacity}"
  else
     echo "Current capacity is at ${capacity}% usage."
  fi
done


# Drive errors
errors=$(/sbin/zpool status | grep ONLINE | grep -v state | awk '{print $3 $4 $5}' | grep -v 000)
if [ "${errors}" ]; then
#  emailSubject="$emailSubject - Drive Errors"
#  problems=1
echo "Drive Error"
else
echo "No drive errors were found."
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