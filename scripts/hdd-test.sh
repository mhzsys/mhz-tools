#!/bin/bash
# Version: 1.1
# Updated: 2021-05-22
# Written by: Nick Damberg
# Perfected by: No one
# Tested OS: Ubuntu 16.04, 18.04, 20.04

START=$(date +%T)
NOW=$(date +"%Y-%m-%d-$START")
NAME="log"
DIR="/tmp/"

if ! [ $(id -u) = 0 ]; then
   echo "Please run as root or with sudo"
   exit 1
fi

echo "Hard Drive Performace Test"
echo "Path to test:"

read TESTPATH

# Write
dd if=$TESTPATH of=sometestfile bs=1M count=1000
# Read
dd if=sometestfile of=$TESTPATH bs=1M count=1000