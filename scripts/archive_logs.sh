#!/bin/bash
# Version: 0.1 beta (untested)
# Updated: 2022-02-03
# Written by: Nick Damberg
# Perfected by: No one

# Coppy this file to /usr/local/bin/archive_logs.sh
# Set up cron job
# crontab -e
# 0 2 * * * /usr/local/bin/archive_logs.sh

# Set the path to your log directory
log_directory="/var/logs"

# Set the path for the archive directory
archive_directory="/var/logs"

# Set the filename for the archive (include timestamp)
archive_filename="logs_$(date '+%Y%m%d_%H%M%S').tar.gz"

# Create the archive
tar -czf "$archive_directory/$archive_filename" -C "$log_directory" .

# Optionally, you can remove old log files after archiving
# find "$log_directory" -type f -name "*.log" -delete