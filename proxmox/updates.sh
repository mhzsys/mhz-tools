#!/bin/bash

(
echo "
# PVE pve-no-subscription repository provided by proxmox.com,
# NOT recommended for production use
deb http://download.proxmox.com/debian/pve buster pve-no-subscription"
) 2>&1 | tee -a /etc/apt/sources.list

sudo rm -rf /etc/apt/sources.list.d/pve-enterprise.list

(
echo "#deb https://enterprise.proxmox.com/debian/pve buster pve-enterprise"
) 2>&1 | tee -a /etc/apt/sources.list.d/pve-enterprise.list

echo "deb http://download.proxmox.com/debian buster pve-no-subscription" > /etc/apt/sources.list.d/pve-no-sub.list

apt-get update && apt-get upgrade -y
apt-get dist-upgrade

sed -i.bak "s/data.status !== 'Active'/false/g" /usr/share/javascript/proxmox-widget-toolkit/proxmoxlib.js && systemctl restart pveproxy.service