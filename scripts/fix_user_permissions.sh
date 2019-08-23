#!/bin/bash

echo "resetting home folder permissions"
sudo chown -R $USER:$(id -gn $USER) $HOME
echo "Home folder permissions reset"