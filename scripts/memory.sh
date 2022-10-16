#!/bin/bash

echo "checking memory"
free -h

echo "clearing cache"
sudo sh -c "sync; echo 3 > /proc/sys/vm/drop_caches"

echo "clearing swap"
sudo swapoff -a; sudo swapon -a

echo "checking memory"
free -h
