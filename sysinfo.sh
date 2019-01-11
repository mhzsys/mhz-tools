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
echo '            System  Information'
sleep 1

# Shows current date and time
date

# Shows who is currently logged into system
who

# Shows how long the system has been running
echo 'Uptime: '$(uptime)

# Shows CPU information
echo 'CPU Info:'
echo $(cat /proc/cpuinfo | grep 'model name' | uniq)
echo 'CPU Cores: '$(cat /proc/cpuinfo | grep processor | wc -l)
# nproc

# shows full cpu info
# lscpu

# Shows processor load average
echo 'Load Average: '$(cat /proc/loadavg)

# Shows number running processes
echo 'Processes: '$(ps -A --no-headers | wc -l)
echo 'Total Threads: '$(ps -AL --no-headers | wc -l)

# Shows number of users logged in
users=$(users | wc -w)
echo 'Users logged in: '$users

# Network information
echo 'Hostname: '$(hostname)
echo 'IP Address: '$(hostname -I)
echo ''

# Shows root HDD usage
echo 'HDD Usage:'
df -h /
echo ''

# Shows memory usage
echo 'Memory Usage:'
free -tm
echo ''

# Check for updates
sudo cat /var/lib/update-notifier/updates-available

# Linux version information
#cat /etc/os-release