# MegahurtZ Systems Linux Admin Tools
Linux administration tools \
Currently only tested to work with Ubuntu

## Update

## System Information

### Check status of service
```
systemctl is-active --quiet <Service_Name> && echo Service is running
```

### This will check if the service is down and perform service restart
```
systemctl is-active --quiet <service name> || <service name> restart
```

## Battery Information

## Screen Settings

## Change Log
### 2019-05-11
- Added new hardware information program hwinfo
- Added installer for nvidia grapics for Ubuntu 16.04 & 18.04

### 2019-01-12
- Created return to main menu option
- Fixed code spacing issues

### 2019-01-11
- Started github repo

## Things to add
### Change termial size
- Will get the current size of the window
```
echo -e "lines\ncols"|tput -S
```
- will resize the window to 100x40 characters.
```
printf '\033[8;40;100t'
```

### mtr is a better tool for network troubleshooting. It is faster and easier to use than original traceroute.
```
$ sudo apt install mtr
```
- To trace route, simply type:
```
$ mtr -t 8.8.8.8
```

### File usage view
```
sudo apt install pydf
pydf
```

### Speedometer
```
sudo apt-get install speedometer
speedometer -r wlo1 -t wlo1
```

### NMAP
```
sudo nmap -sP -PE -PA21,23,80,3389 192.168.1.*
```

### hwinfo
```
hwinfo --short
hwinfo --gfxcard --short
```

### Nodejs
- https://github.com/nodesource/distributions/tree/master/deb