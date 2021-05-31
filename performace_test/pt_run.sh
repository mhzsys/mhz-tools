#!/bin/bash

# -p [1-256] Number of Test Processes to run. Setting more test threads than your system supports will force test duration to Very Long.
# -i [1-100] Number of Test Iterations to run
# -d [1-4] [Short, Medium, Long, Very Long]

# Install Dependencies
sudo apt-get install libncurses5

# Run Performace Test
sudo ./pt_linux_x64
